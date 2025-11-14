ALTER TABLE Pagamento
ADD CONSTRAINT fk_pagamento_consulta
FOREIGN KEY (id_consulta) REFERENCES Consulta(id_consulta);
