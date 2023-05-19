# MsgBoxPersonal

Classe criada para exibir mensagens personalizadas. Nela é possivel exibir fotos e gif animados. O texto que é exibido tambem pode ser copiado facilmente.

![image](![image](https://github.com/andreCLima/MsgBoxPersonal/assets/90877034/25a71c79-4e56-44bd-9738-ecd77f73a7e7))

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





