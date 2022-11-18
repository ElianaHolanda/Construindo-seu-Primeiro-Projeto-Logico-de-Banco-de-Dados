use oficina;
insert into Cliente (Nome, Telefone, CPF, CNPJ)values
	('Maria do Socorro', 12346789, 21985432156, null), 
	('Matheus de Oliveira', 987654321, 91997654321, null),
	('Ricardo Silva', 45678913, 34982543211, null),
    ('Julia França', 789123456, 94992534212, null),
    ('Roberta Assis', 98745631, 22986543256, null),
    ('Isabela Cruz', 654789123, 91982567732, null);
    
    desc Cliente;
    select * from Cliente;
    
    insert into Tipo_De_Servico (idTipo_De_Servico, Descrição) values
		(1, 'Serviço de lanternagem'),
        (2, 'Troca de Óleo');
        
	select * from Tipo_De_Servico;