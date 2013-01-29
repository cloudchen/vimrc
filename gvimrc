if exists("+transparency")
    set transparency=0
endif
set antialias
set columns=195
set lines=45
set guioptions+=ce
set guitablabel=%{public#TabLabel()}%t
set guifont=Monaco:h12,\ Courier_New:h9
if(has("win32") || has("win95") || has("win64") || has("win16"))
    set guifontwide=SimHei:h9
end if
winpos 0 0
