function live_grep_args(fileType)
	require('telescope.builtin').live_grep({glob_pattern=fileType})
end
