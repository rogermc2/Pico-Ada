
function Fix_Header ()
    1, 15 substitute /@version\(\s\+\)1.0/@version\15.9.0/e
    1, 15 substitute /&copy;, \(\d\{4}\), /© \1 … 2022 /e
    1, 15 substitute /Copyright (C) \(\d\{4}\), / Copyright © \1 … 2022 /e
    1, 15 substitute /Copyright (C) \(\d\{4}\) / Copyright © \1 … 2022 /e

    1, 15 global /@date/ delete
    1, 15 global /@revision/ delete
    1, 15 global /@uml/ delete
    1, 15 global /\$Id\$/ delete
    1, 15 global /\$Author\$/ delete
    1, 15 global /\$Date\$/ delete
    1, 15 global /\$Revision\$/ delete
    1, 15 global /\$HeadURL\$/ delete

    % substitute /pragma Ada_05;/pragma Ada_2022;/
endfunction

function Fix_Parentesis ()
    %substitute /procedure \(.*\)\n\(\s*\)(/procedure \1 (/e
    %substitute /function \(.*\)\n\(\s*\)(/function \1 (/e
    %substitute /\V\n\(\s\*\)(/ (\r\1 /e
endfunction Fix_Parentesis

function Move_Parameter_Comment ()
    let l:Line=line(".")
    normal Vx
    ?\(procedure\|function\)?-1
    normal p
    execute ":" . (l:Line + 2)
endfunction Move_Parameter_Comment

function Trace_Comment ()
    bufdo %substitute /\V    pragma Unreferenced (Trace);/    --  pragma Unreferenced (Trace);/e
    bufdo %substitute /\V    Trace : AdaCL.Trace.Object/    --  Trace : AdaCL.Trace.Object/e
endfunction Move_Parameter_Comment

function Fix_Comments ()
    1,20 substitute /^-- /--:/e
    $-3,$ substitute /^-- /--:/e
endfunction Fix_Comments

function HTML_To_MD ()
    substitute /<A.\{-}HREF="\(.\{-}\)".\{-}">\(.\{-}\)<\/A>/[\2](\1)/g
endfunction Fix_Comments

function Link_Picture ()
    substitute /\V![](\(\.\{-}\)?width=640px)/[\0](\1)
endfunction Link_Picture

function Picture_Hugo_To_MD (section)
    . substitute ;\V[![](\(\.\{-}\))](\(\.\{-}\));[<img src="https://tutorial-6502.sourceforge.io/install_linux/\1" width="640"/>](https://tutorial-6502.sourceforge.io/install_linux/Screenshot_at_Jul_16_18-37-15.png);
endfunction Picture_Hugo_To_MD

function Pico_To_Pico2 ()
    % substitute /\CPico_/Pico2_/ge
    % substitute /\Cpico_/pico2_/ge
    % substitute /\CRPI-RP2/RP2350/ge
endfunction Pico_To_Pico2

function Alire_Pico_To_Pico2 ()
    % global /^pico_bsp/                 delete
    % global /^rp2040_hal.Use_Startup/   delete
    % global /^rp2040_hal.Interrupts/    delete

    % substitute /\C"pico"/"pico2"/ge
    % substitute /\C"rp2040"/"rp2350"/ge
    % substitute /\C"rpi_pico"/"rpi_pico2"/ge
    % substitute /\CPico_/Pico2_/ge
    % substitute /\Cpico_/pico2_/ge
    % substitute /\CRPI-RP2/RP2350/ge
    % substitute /\C_rp2040/_rp2350/ge

    % global /^rp2040_hal/ substitute /"^2.7"/"^3.0.0-alpha1"/ge

    /\V[configuration.values]/ append
rp2040_hal.device               = "RP2350A"
.

    /\V[configuration.values]/ insert
[[pins]]
rp2040_hal = { url='https://github.com/JeremyGrosser/rp2040_hal', branch='3.x' }

.
endfunction Alire_Pico_To_Pico2

nmap <F12>tc  :1,10 substitute /^\(date\s*: \).*$/\= submatch(1)    . strftime("%Y-%m-%dT%T%z",expand("%")->getftime()) /<CR>
nmap <F12>tm  :1,10 substitute /^\(lastmod\s*: \).*$/\= submatch(1) . strftime("%Y-%m-%dT%T%z",expand("%")->getftime()) /<CR>
imap <F12>t  <C-R>=strftime("%Y-%m-%dT%T%z",expand("%")->getftime())<CR>

