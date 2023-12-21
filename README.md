# Daily Focus

A Neovim plugin to return a daily Vim tip to focus on for the day. Designed to
be used for things like adding to a Lualine section.

If you provide a `tips` file, this plugin will go through it sequentially
making each tip active for an entire day. The idea is that you will focus on
using this tip as many times througout the day as is practical. The goal is to
reinforce Vim commands, motions, keymaps, etc.

My use case is adding it to my Lualine so that the tip is front-and-center
throughout my Neovim sessions every day.

> NOTE: This far from a general working plugin. There's lots of hard-coding to
> my particular setup. I'm using it to learn how to make a Neovim plugin. I'll
> remove this banner when it's ready for general use.
