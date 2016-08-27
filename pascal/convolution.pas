{$DEFINE ZERO_LOOP}
program convolution;

uses
  math, sysutils;

// NOTE! the array that `output` points to must be >= a_len+b_len-1
procedure convolution(const input_a: PDouble; const a_len: LongInt;
                      const input_b: PDouble; const b_len: LongInt;
                      output_: PDouble);
var
  i,j: LongInt;
  x: Double;
  y: PDouble;
begin
{$IFDEF ZERO_LOOP}
    for i:=0 to a_len + b_len-1 do
        output_[i]:=0.0;
{$ELSE}
    FillChar(output_^,(a_len+b_len-1)*sizeof(Double),#0);
{$ENDIF}

    for i:=0 to a_len-1 do
    begin
        // cheating a bit, the compiler won't move this out from
        // the inner loop for us, so we have to it by hand
        x:=input_a[i];
        y:=@output_[i];
        for j:=0 to b_len-1 do
            y[j]:=y[j] + (x * input_b[j]);
    end;
end;

procedure test;
var
  input_a: array[0..4999] of Double;
  input_b: array[0..4999] of Double;
  output_: array[0..length(input_a) + length(input_b) - 1] of Double;
  start, diff: Int64;
  i: LongInt;
begin
    for i:=0 to 4999 do
    begin
        input_a[i] := sin(i / 8.0);
        input_b[i] := cos(i / 8.0);
    end;

    writeln('Start');

    start:=GetTickCount64;
    convolution(@input_a,length(input_a),@input_b,length(input_b),@output_);
    diff:=GetTickCount64-start;

    writeln('Done');

    writeln('Pascal time taken ',diff div 1000,' seconds ',diff mod 1000,' milliseconds');
end;

begin
    test;
end.
