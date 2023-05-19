# MsgBoxPersonal

Classe criada para exibir mensagens personalizadas, é uma substituta do messagebox. Nela é possivel exibir fotos e gif animados. O texto que é exibido tambem pode ser copiado facilmente.

![image](https://github.com/andreCLima/MsgBoxPersonal/assets/90877034/60a77fae-1d1c-4f40-a03b-6f398bc4d6c9)

![image](https://github.com/andreCLima/MsgBoxPersonal/assets/90877034/a8f8c5f8-f73e-4bad-a2da-66c022c9aaa0)


# 🔨: Funcionalidades do projeto

- `MsgBox('seu texto', tpYesNo)`: Mensagem com pergunta de sim ou não 
- `MsgBox('seu texto', tpErro)`: Mensagem de erro com a opção de ok
- `MsgBox('seu texto', tpOk)`: Mensagem de confirmção com a opção de ok


# 🦾: Exemplo de uso
```pascal
{$R *.dfm}

uses Util.MsgBox;

procedure TForm1.Button1Click(Sender: TObject);
begin
  if MsgBox('Deseja continuar?', tpYesNo) then
    ShowMessage('ok');
end;
```

# Autor

[<img src="https://avatars.githubusercontent.com/u/90877034?v=4" width=115><br><sub>André Lima</sub>](https://github.com/andreCLima)





