defmodule Credo.Check.Readability.MultiAlias do
  use Credo.Check,
    base_priority: :low,
    tags: [:controversial],
    explanations: [
      check: """
      Multi alias expansion makes module uses harder to search for in large code bases.

          # preferred

          alias Module.Foo
          alias Module.Bar

          # NOT preferred

          alias Module.{Foo, Bar}

      Like all `Readability` issues, this one is not a technical concern.
      But you can improve the odds of others reading and liking your code by making
      it easier to follow.
      """
    ]

  alias Credo.Code

  @doc false
  @impl true
  def run(%SourceFile{} = source_file, params) do
    issue_meta = IssueMeta.for(source_file, params)

    Code.prewalk(source_file, &traverse(&1, &2, issue_meta))
  end

  # TODO: consider for experimental check front-loader (ast)
  defp traverse(
         {:alias, _, [{{_, _, [{:__aliases__, opts, base_alias}, :{}]}, _, [multi_alias | _]}]} =
           ast,
         issues,
         issue_meta
       ) do
    {:__aliases__, _, module} = multi_alias
    module = Enum.join(module, ".")

    new_issue = issue_for(issue_meta, Keyword.get(opts, :line), base_alias, module)

    {ast, [new_issue | issues]}
  end

  defp traverse(ast, issues, _issue_meta), do: {ast, issues}

  defp issue_for(issue_meta, line_no, base_alias, trigger) do
    module =
      base_alias
      |> Module.concat()
      |> Module.concat(trigger)
      |> inspect()

    format_issue(
      issue_meta,
      message: "Avoid multi aliases to #{module}; consider removing.",
      trigger: trigger,
      line_no: line_no
    )
  end
end
