function prompt-jobs-model -d 'Updates background jobs counter'
  set -gx PROMPT_MODEL_JOBS (jobs | wc -l)
end
