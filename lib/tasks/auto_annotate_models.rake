# frozen_string_literal: true

task :set_annotation_options do
  # You can override any of these by setting an environment variable of the
  # same name.
  Annotate.set_defaults(
    "additional_file_patterns" => [],
    "models" => "true",
    "position_in_class" => "before",
    "show_foreign_keys" => "true",
    "show_complete_foreign_keys" => "false",
    "show_indexes" => "true",
    "simple_indexes" => "false",
    "model_dir" => "app/models",
    "root_dir" => "",
    "include_version" => "false",
    "require" => "",
    "exclude_sti_subclasses" => "false",
    "ignore_model_sub_dir" => "false",
    "ignore_unknown_models" => "false",
    "hide_limit_column_types" => "integer,bigint,boolean",
    "hide_default_column_types" => "json,jsonb,hstore",
    "skip_on_db_migrate" => "true",
    "format_bare" => "true",
    "format_rdoc" => "false",
    "format_yard" => "false",
    "format_markdown" => "false",
    "classified_sort" => "true",
    "trace" => "false",
    "with_comment" => "true"
  )
end
