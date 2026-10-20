#!/usr/bin/env -S jq -rf

# Claude Code status line: model, context use, and plan usage limits.

def pct($label):
  values | floor # values: skip fields not sent yet
  | (if . >= 80 then 31 elif . >= 50 then 33 else 32 end) as $color
  | "\($label) \u001b[\($color)m\(.)%\u001b[0m";

[
  .model.display_name,
  (.context_window.used_percentage | pct("context")),
  (.rate_limits.five_hour.used_percentage | pct("session")),
  (.rate_limits.seven_day.used_percentage | pct("weekly"))
] | join(" | ")
