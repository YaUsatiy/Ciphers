unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

type
  Square = array[1..4,1..4] of Char;
  coord = array[1..8] of Integer;
  TForm1 = class(TForm)
    lbl1: TLabel;
    lbl2: TLabel;
    lbl3: TLabel;
    bt1: TButton;
    bt2: TButton;
    bt3: TButton;
    bt4: TButton;
    bt5: TButton;
    bt6: TButton;
    lbl4: TLabel;
    edt1: TEdit;
    Label1: TLabel;
    edt2: TEdit;
    dlgOpen1: TOpenDialog;
    procedure Open(var temp: string; const name: string);
    procedure Save(const temp, name: string);
    procedure WriteInSg(const temp: string; var index: Integer;var Sq: Square; Arr: coord);
    procedure RotSqEnc(const Name: string);
    function WriteInSgDec(var Sq: Square; Arr: coord; var temp: String): String;
    procedure VigenereAlgEncrypt(var key : string; const name : string);
    procedure VigenereAlgDecrypt(var Key: String);
    procedure RotSqDec();
    procedure ColAlgEnc(var Key: String; const Name: string);
    procedure ColAlgDec(var Key: string);
    procedure bt3Click(Sender: TObject);
    procedure bt6Click(Sender: TObject);
    procedure bt1Click(Sender: TObject);
    procedure bt4Click(Sender: TObject);
    procedure bt2Click(Sender: TObject);
    procedure bt5Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
  countRow: Byte;
  arr:array[0..255,0..255] of string; 
  kol_pereh:Integer;

implementation

{$R *.dfm}

procedure TForm1.Open(var temp: string; const name: string);
var
  F: TextFile;
begin
  AssignFile(F, name);
  Reset(F);
  while not Eof(f) do
  begin
    readln(F, Temp);
    Temp := AnsiUpperCase(Temp);
  end;
  CloseFile(F);
end;

procedure TForm1.Save(const temp, name: string);
var
  F: TextFile;
begin
  AssignFile(F, name);
  Rewrite(F);
  writeln(F, temp);
  CloseFile(F);
end;
//////////////////////////////////////////////////// вращающа€с€ решетка
procedure TForm1.WriteInSg(const temp: string; var index: Integer; var Sq: Square; Arr: coord);
var
  i, j: Integer;
begin
  i := 1;
  j := ord('1');
  While (i <= 7) do
  begin
    Sq[Arr[i], Arr[i + 1]] := chr(j);
    i := i + 2;
    inc(j);
  end;
  for i := 1 to 4 do
  begin
    for j := 1 to 4 do
    begin
      if (Sq[i,j] in ['1'..'4']) then
      begin
        if (Length(temp) - index >= 0) then
        begin
          Sq[i,j] := temp[index];
        end
        else
          Sq[i,j] := '+';
        inc(index);
      end;
    end;
  end;
end;
procedure TForm1.RotSqEnc(const Name: string);
const
  cord1: coord = (1, 1, 2, 4, 3, 3, 4, 2);
  cord2: coord = (1, 4, 4, 3, 3, 2, 2, 1);
  cord3: coord = (4, 4, 3, 1, 2, 2, 1, 3);
  cord4: coord = (4, 1, 3, 4, 2, 3, 1, 2);
var
  Sq: Square;
  Temp, plain: string;
  index, i, j: Integer;
begin
  Open(temp, name);
  plain := '';
  for i := 1 to Length(Temp) do
  begin
    if (Temp[i] in ['A'..'Z']) then
      plain := plain + Temp[i];
  end;
  temp := '';
  index := 1;
  while(Length(plain) - index >= 0)do
  begin
    WriteInSg(plain, index, Sq, cord1);
    WriteInSg(plain, index, Sq, cord2);
    WriteInSg(plain, index, Sq, cord3);
    WriteInSg(plain, index, Sq, cord4);
    for i := 1 to 4 do
      for j := 1 to 4 do
      begin
        //write(sq[i,j]);
        temp := temp + sq[i,j];
        sq[i,j] := ' ';
      end;
  end;
  //Writeln(temp);
  Save(Temp, 'RotEncrypt.txt');
end;

function TForm1.WriteInSgDec(var Sq: Square; Arr: coord; var temp: String): String;
var
  SqWithNum: Square;
  i, j: Integer;
begin
  i := 1;
  j := ord('1');
  While (i <= 7) do
  begin
    SqWithNum[Arr[i], Arr[i + 1]] := chr(j);
    i := i + 2;
    inc(j);
  end;
  Result := '';
  for i := 1 to 4 do
  begin
    for j := 1 to 4 do
    begin
      if (SqWithNum[i,j] in ['1'..'4']) then
      begin
        if (sq[i,j] in ['A'..'Z']) then
          temp := temp + Sq[i,j];
        SqWithNum[i,j] := '0';
      end;
    end;
  end;
end;

procedure TForm1.RotSqDec();
const
  cord1: coord = (1, 1, 2, 4, 3, 3, 4, 2);
  cord2: coord = (1, 4, 4, 3, 3, 2, 2, 1);
  cord3: coord = (4, 4, 3, 1, 2, 2, 1, 3);
  cord4: coord = (4, 1, 3, 4, 2, 3, 1, 2);
var
  Sq: Square;
  Temp, plain: string;
  index, i, j: Integer;
begin
  Open(temp, 'RotEncrypt.txt');
  for i := 1 to Length(temp) do
  begin
    if (temp[i] in ['A'..'Z','+']) then
      plain := plain + temp[i];
  end;
  temp := '';
  index := 1;
  while(Length(plain) - index >= 0) do
  begin
    for i := 1 to 4 do
      for j := 1 to 4 do
      begin
        sq[i,j] := plain[index];
        inc(index);
      end;
    WriteInSgDec(Sq, cord1, temp);
    WriteInSgDec(Sq, cord2, temp);
    WriteInSgDec(Sq, cord3, temp);
    WriteInSgDec(Sq, cord4, temp);
  end;
  //Writeln;
  //writeln(temp);
  Save(Temp, 'RotDecrypt.txt');
end;

procedure TForm1.bt3Click(Sender: TObject);
begin
  if dlgOpen1.Execute then
  begin
    RotSqEnc(dlgOpen1.FileName);
  end;
end;

procedure TForm1.bt6Click(Sender: TObject);
begin
  RotSqDec();
end;

procedure TForm1.VigenereAlgEncrypt(var key : string; const name : string);
const
  alph = 'јЅ¬√ƒ≈®∆«»… ЋћЌќѕ–—“”‘’÷„ЎўЏџ№Ёёя';
  n=33;
var
  i,j,razn : byte;
  key_n, plain, cipher,temp: string;
  tmp1,tmp2:Byte;
begin
  Key := AnsiUpperCase(Key);

  Open(temp, name);

  key_n:='';
  plain:='';
  for i := 1 to Length(Key) do
  begin
    if (key[i] in ['ј'..'я','®']) then
      key_n:=key_n+ key[i];
  end;
  for i := 1 to Length(Temp) do
  begin
    if (Temp[i] in ['ј'..'я','®']) then
      plain:=plain+temp[i];
  end;

//выравнивание ключа
  key:=key_n;
  if Length(key_n)<Length(plain) then
    Insert(plain,key,Length(key)+1);
  if Length(key)>Length(plain) then
  begin
    razn:=Length(key)- Length(plain);
    Delete(key,Length(key)-razn+1,razn);
  end;

  cipher:=plain;
  for i:=1 to Length(plain) do
  begin
    tmp1:=(Pos(plain[i],alph)-1);
    tmp2:=(Pos(key[i],alph)-1);
    cipher[i]:=alph[(tmp1  + tmp2 )mod 33 +1];
  end;

  Save(key, 'VigenereEncryptKey.txt');
  Save(cipher, 'VigenereEncrypt.txt');

end;

procedure TForm1.VigenereAlgDecrypt(var Key: String);
const
  alph = 'јЅ¬√ƒ≈®∆«»… ЋћЌќѕ–—“”‘’÷„ЎўЏџ№Ёёя';
  n=33;
var
  i,j,razn : byte;
  key_n, plain, cipher,temp: string;
begin
  Key := AnsiUpperCase(Key);

  Open(temp,'VigenereEncrypt.txt');

  key_n:='';
  cipher:='';
  for i := 1 to Length(Key) do
  begin
    if (key[i] in ['ј'..'я','®']) then
      key_n:=key_n+ key[i];
  end;
  for i := 1 to Length(Temp) do
  begin
    if (Temp[i] in ['ј'..'я','®']) then
      cipher:=cipher+temp[i];
  end;

//выравнивание ключа
  key:=key_n;
  if Length(key_n)<Length(cipher) then
    Insert(cipher,key,Length(key)+1);
  if Length(key)>Length(cipher) then
  begin
    razn:=Length(key)- Length(cipher);
    Delete(key,Length(key)-razn+1,razn);
  end;

  plain:=cipher;
  for i:=1 to Length(cipher) do
  begin
    plain[i]:=alph[( (Pos(cipher[i],alph)-1) - (Pos(key[i],alph)-1) + 33 )mod 33 +1];
  end;


  Save(plain,'VigenereDecrypt.txt');
end;

procedure TForm1.ColAlgEnc(var Key: String; const Name: string);
const
  alph='ABCDEFGHIJKLMNOPQRSTUVWXYZ';
  n=26;
var
  sch,k,tmp:Integer;
  s,temp:string;
  plain,cipher:string;
  i,j:Byte;
begin
  Key := AnsiUpperCase(Key);
  Open(temp, name);
  s := '';
  for i := 1 to Length(Key) do
  begin
    if (key[i] in ['A'..'Z']) then
      s := s + Key[i];
  end;
  Key:=s;

  plain := '';
  for i := 1 to Length(Temp) do
  begin
    if (Temp[i] in ['A'..'Z']) then
      plain := plain + Temp[i];
  end;

  for i:=1 to length(key) do
    arr[0,i-1]:=key[i];

  sch:=0;
  for i:=1 to n do
    for j:=1 to Length(key) do
    begin
      if alph[i]=key[j] then
      begin
        Inc(sch);
        arr[1,j-1]:=IntToStr(sch);
      end;
    end;

  sch:=0;
  i:=2;
  j:=1;
  kol_pereh:=0;

  for k:=1 to Length(plain) do
  begin
    arr[i,j-1]:=plain[k];
    Inc(sch);
    Inc(j);
    if sch=Length(key) then //переходить ли на новую строку
    if (k<>Length(plain)) then
      begin
        inc(i);
        j:=1;
        sch:=0;
      end;
    if Length(Key)<>0 then
    if ((i-2)=(length(plain) div Length(Key)))  then
      Inc(kol_pereh);

      dec(kol_pereh);  //из-за того, что при (k<>Length(plain)) i останетс€ прежней, значит  kol_pereh станет больше, чем надо
  end;

  countRow:=i;//хранитс€ число строк, заполненных plain
  //считывание по столбцам
  cipher:='';
  for j:=1 to Length(key) do
  begin
    K:=0;
    repeat
      Inc(k);//в k хранитс€ номер столбца дл€ считывани€ по пор€дку
    until arr[1,k-1]=IntToStr(j);

    for sch:=2 to countRow do
      cipher:=cipher+ arr[sch,k-1];

  end;

  Save(key,'ColEncryptKey.txt');
  Save(cipher, 'ColEncrypt.txt');

end;

procedure TForm1.ColAlgDec(var Key: string);
const
  alph='ABCDEFGHIJKLMNOPQRSTUVWXYZ';
  n=26;
var
  sch,k,tmp,razn:Integer;
  s,temp:string;
  plain,cipher:string;
  i,j:Byte;
begin
  Key := AnsiUpperCase(Key);
  Open(temp, 'ColEncrypt.txt');

  s := '';
  for i := 1 to Length(Key) do
  begin
    if (key[i] in ['A'..'Z']) then
      s := s + Key[i];
  end;
  Key:=s;

  cipher := '';
  for i := 1 to Length(Temp) do
  begin
    if (Temp[i] in ['A'..'Z']) then
      cipher := cipher + Temp[i];
  end;

  i:=1;
  sch:=2;
  for j:=1 to Length(key) do
  begin
    K:=0;
    repeat
      Inc(k);//в k хранитс€ номер столбца дл€ считывани€ по пор€дку
    until arr[1,k-1]=IntToStr(j);

    if k<=kol_pereh then
    while sch<=countRow do
    begin
      arr[sch,k-1]:=cipher[i];
      inc(i);
      Inc(sch);
    end
    else
    while sch<=(countRow-1) do
    begin
      arr[sch,k-1]:=cipher[i];
      inc(i);
      Inc(sch);
    end;
  end;

  S:='';
  for i:=2 to countRow do
    for j:=0 to (Length(key)-1) do
      S:=S+ arr[i,j];

  Save(s, 'ColDecrypt.txt');


end;

procedure TForm1.bt1Click(Sender: TObject);
var
  key: string;
begin
  key := edt1.Text;
  if dlgOpen1.Execute then
  begin
    VigenereAlgEncrypt(Key, dlgOpen1.FileName);
  end;
end;

procedure TForm1.bt4Click(Sender: TObject);
var
  key: string;
begin
  key := edt1.Text;
  VigenereAlgDecrypt(key);
end;

procedure TForm1.bt2Click(Sender: TObject);
var
  key: string;
begin
  key := edt2.Text;
  if dlgOpen1.Execute then
  begin
    ColAlgEnc(Key,dlgOpen1.FileName);
  end;
end;

procedure TForm1.bt5Click(Sender: TObject);
var
  key: string;
begin
  key := edt2.Text;
  ColAlgDec(Key);
end;

end.
