function invoke --argument-names function_name --description "invoke lambda function"
  set --local stage (string lower -- (string replace --regex ".*@" "" -- $AWS_PROFILE))
  set --local start_time (date -u "+%Y%m%dT%H%M%S")
  set --local command "sls invoke --aws-profile $AWS_PROFILE --stage $stage --type Event --function $argv"
  echo (set_color green)$command(set_color normal)
  eval $command
  logs $function_name $start_time
end
