create database bdHotel

go 

use bdHotel

go


create table tbCliente( 
 idCliente int primary key identity (1,1)
 ,nomeCliente varchar (50) not null
 ,datNascCliente smalldatetime not null
 ,cpfCliente varchar (11) not null
)
create table tbReserva(
 idReserva int primary key identity (1,1)
 ,dataReserva smalldatetime not null
 ,horaReserva time not null
 ,idCliente int foreign key references tbCliente(idCliente) not null
 ,dataPrevistaCheckin smalldatetime not null
 ,dataPrevistaCheckout smalldatetime not null
 ,numHospedes int not null
 ,numAptos int not null
 ,valorReserva money not null
 ,valorEntrada money not null
) 
create table tbTipoApto(
 idTipoApto int primary key identity (1,1)
 ,descricaoTipoApto varchar(50) not null
)
create table tbApto(
 idApto int primary key identity  (1,1)
 ,descicaoApto varchar(50) not null
 ,andarApto int not null
 ,idTipoApto int foreign key references tbTipoApto(idTipoApto) not null
)
create table tbReservaApto(
 idReservaApto int primary key identity (1,1)
 ,idReserva int foreign key references tbReserva(idReserva) not null
 ,idTipoApto int foreign key references tbTipoApto(idTipoApto) not null
)
create table tbHospedagem(
 idHospedagem int primary key identity (1,1)
 ,idReserva int foreign key references tbReserva(idReserva) not null
 ,idApto int foreign key references tbApto(idApto) not null
)
create table tbHospede(
 idHospede int primary key identity (1,1)
 ,nomeHospede varchar(50) not null
 ,dataNascHospede smalldatetime not null
 ,emailHospede varchar (50) not null
)
create table tbProduto(
idProduto int primary key identity(6,66)
,descricaoProduto varchar (60) not null
,valorProduto smallmoney not null
,qtdProduto int not null
)
create table tbServico(
idServico int primary key identity(1,1)
,descricaoServico varchar (60) not null
,valorServico smallmoney not null
)
create table tbCompraProduto(
idCompraProduto int primary key identity(1,1)
,idProduto int foreign key references tbProduto(idProduto) not null
)
create table tbContrato(
idContrato int primary key identity(1,1)
,idServico int foreign key references tbServico(idServico) not null
)
create table tbConta(
 idConta int primary key identity (1,1)
 ,dataAberturaConta smalldatetime not null
 ,idHospedagem int foreign key references tbHospedagem(idHospedagem) not null
 ,idCompraProduto int foreign key references tbCompraProduto(idCompraProduto)
 ,idContrato int foreign key references tbContrato(idContrato)
 ,valorTotalConta money not null
 ,dataFechaduraConta smalldatetime not null
)
create table tbChekin(
idCheckin int primary key identity (1,1)
,dataCheckin date not null
,dataCheckOut date not null
,idHospede int foreign key references tbHospede(idHospede) not null
,idHospedagem int foreign key references tbHospedagem(idHospedagem) not null
)
create table tbPagamento(
idPagamento int primary key identity (1,1)
,dataPagamento date not null
,idConta int foreign key references tbConta (idConta)
)
create table tbTipoPagamento(
idTipoPagamento int primary key identity (1,1)
,descTipoPagamento varchar (200) 
)
create table tbParcela(
idParcela int primary key identity (1,1)
,qntdParcela smallmoney not null
,idPagamento int foreign key references tbPagamento(idPagamento) not null
,idTipoPagamento int foreign key references tbTipoPagamento(idTipoPagamento) not null
)
create table tbTelefonecliente(
idTelefoneCliente int primary key identity(1,1)
,numTelefoneCliente int not null
,idCliente int foreign key references tbCliente(idCliente)
)
go