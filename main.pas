program mini_interpreter

var 
    txt : string;

procedure ProcessText(start : word; stop : word; s : string);
var i, aux_i:word;
    p_int : ^integer;
    local_i, local_j, a, b : integer;
begin
    p_int := getmem(1);
    p_int^ := 0;
    for i := start to stop do 
    begin 
        if s[i] = '>' then
            begin
                inc(p_int);
                p_int^ := 0;
            end;
        if s[i] = '<' then 
            dec(p_int);
            
        if s[i] = '.' then
            write(p_int^);
            
        if s[i] = '+' then 
            p_int^ := p_int^ + 1;
            
        if s[i] = '-' then 
            dec(p_int^);

        if s[i] = '*' then 
        begin 
            a := p_int^;
            inc(p_int);
            b := p_int^;
            dec(p_int);
            p_int^ := a*b;
        end;
        
        if s[i] = '$' then 
            write(chr(p_int^));
        
        if s[i] = '0' then 
            p_int^ := 0;  
    end;
end;

begin
    txt := '';
    ProcessText(1, length(txt), txt);
end.
