" replace tab with 4 whitespaces
silent! :%s/	/    /g

" remove all 'err' variables
silent! :%s/, err :=/ :=/g
silent! :%s/, err =/ =/g


" remove following snippet
" if err != nil {
"     return err
" }
silent! :%g/\s\+if err != nil {\n\s\+return err\n\s\+}/d3

" simplify ctx argument
silent! :%s/ctx context.Context/ctx /g

" simplify the following snippet
"
" if err := setupKernelTunables(b); err != nil {
"     return xxx
" }
"
" to:
"
" setupKernelTunables(b)
silent! :%s/\(\s\+\)if err := \(.*\); err != nil {\n\s\+return .*\n\s\+}/\1\2/g
