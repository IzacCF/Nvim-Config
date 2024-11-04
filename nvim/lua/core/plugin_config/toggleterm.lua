local status, toggleterm = pcall(require, "toggleterm")

if not status then
	return
end

toggleterm.setup({
	size = 10, -- Não será usado quando `direction` for "float"
	open_mapping = [[<F6>]],
	shading_factor = 2,
	direction = "float",
	float_opts = {
		border = "curved",
		width = 130, -- Largura do terminal flutuante
		height = 30, -- Altura do terminal flutuante
		highlights = {
			border = "Normal",
			background = "Normal",
		},
	},
})
