# Everything below is Windows-only.
if (-not $IsWindows) { return }

# Scoop tab completion, loaded on first use. The module replaces this completer with its own.
Register-ArgumentCompleter -Native -CommandName scoop -ScriptBlock {
    param($wordToComplete, $commandAst, $cursorPosition)
    Import-Module scoop-completion -ErrorAction SilentlyContinue
    # Without the module, TabExpansion2 would call this completer again, endlessly.
    if (Get-Module scoop-completion) {
        (TabExpansion2 $commandAst.Extent.Text $cursorPosition).CompletionMatches
    }
}
