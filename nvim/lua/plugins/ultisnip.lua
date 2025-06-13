return {
	'SirVer/ultisnips',
	config = function()
		vim.cmd([[
			nmap mps :UltiSnipsEdit<cr>
			nmap mpS :vs<cr>:UltiSnipsEdit<cr>
			" los archivos que pueden agregar son .snippets
			nmap mPs :UltiSnipsAddFiletypes
			let g:UltiSnipsExpandTrigger="<nop>"
			let g:UltiSnipsJumpForwardTrigger="<c-s>"
			let g:UltiSnipsJumpBackwardTrigger="<c-h>"
			"let g:UltiSnipsEditSplit="vertical"
			let g:UltiSnipsSnippetDirectories=[$HOME.'/Projects/nvim/snippets']
			"let g:UltiSnipsSnippetDirectories=[$HOME.'/.vim/bundle/vim-snippets/UltiSnips']
		]])
	end
}


