#!/usr/bin/env bash
# Claude Code status line — mirrors Powerlevel10k classic layout
# Segments: user@host  cwd  git-branch  |  model  context%  tokens

input=$(cat)

# --- Extract fields from JSON ---
cwd=$(echo "$input" | jq -r '.workspace.current_dir // .cwd // empty')
model=$(echo "$input" | jq -r '.model.display_name // empty')
used_pct=$(echo "$input" | jq -r '.context_window.used_percentage // empty')
total_in=$(echo "$input" | jq -r '.context_window.total_input_tokens // empty')
total_out=$(echo "$input" | jq -r '.context_window.total_output_tokens // empty')

# --- user@host ---
user=$(whoami)
host=$(hostname -s)

# --- Shorten cwd: replace $HOME with ~ ---
home_dir="$HOME"
short_cwd="${cwd/#$home_dir/~}"

# --- Git branch (skip lock to avoid interfering with running git ops) ---
git_branch=""
if [ -n "$cwd" ] && git -C "$cwd" rev-parse --git-dir > /dev/null 2>&1; then
  git_branch=$(git -C "$cwd" --no-optional-locks symbolic-ref --short HEAD 2>/dev/null \
               || git -C "$cwd" --no-optional-locks rev-parse --short HEAD 2>/dev/null)
fi

# --- Build left segment: user@host  path  [branch] ---
left=""
left+="${user}@${host}"
left+="  ${short_cwd}"
[ -n "$git_branch" ] && left+="  ${git_branch}"

# --- Format token counts with K/M suffix ---
format_tokens() {
  local n="$1"
  if [ -z "$n" ] || [ "$n" = "0" ]; then
    echo ""
    return
  fi
  if [ "$n" -ge 1000000 ] 2>/dev/null; then
    printf "%.1fM" "$(echo "scale=1; $n / 1000000" | bc)"
  elif [ "$n" -ge 1000 ] 2>/dev/null; then
    printf "%.1fK" "$(echo "scale=1; $n / 1000" | bc)"
  else
    echo "$n"
  fi
}

# --- Build right segment: model  ctx%  tokens ---
right=""
[ -n "$model" ] && right+="${model}"
if [ -n "$used_pct" ]; then
  used_int=${used_pct%.*}   # truncate decimals for display
  [ -n "$right" ] && right+="  "
  right+="ctx: ${used_int}%"
fi
if [ -n "$total_in" ] || [ -n "$total_out" ]; then
  in_fmt=$(format_tokens "$total_in")
  out_fmt=$(format_tokens "$total_out")
  token_str=""
  [ -n "$in_fmt" ] && token_str+="in:${in_fmt}"
  if [ -n "$out_fmt" ]; then
    [ -n "$token_str" ] && token_str+=" "
    token_str+="out:${out_fmt}"
  fi
  if [ -n "$token_str" ]; then
    [ -n "$right" ] && right+="  "
    right+="tokens(${token_str})"
  fi
fi

# --- Print with ANSI dim colors ---
# dim cyan for left, dim white for right
printf "\033[2;36m%s\033[0m" "$left"
[ -n "$right" ] && printf "  \033[2;37m%s\033[0m" "$right"
printf "\n"
