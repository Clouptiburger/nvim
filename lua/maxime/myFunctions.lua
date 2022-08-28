print("j'arrive dans le module")
local myFunctions = {}

myFunctions.myPrint = function()
    print("salut c'est maxime")
end


myFunctions.live_grep_args = function()
	require('telescope.builtin').live_grep({glob_pattern='*.*'})
end


return myFunctions
