SELECT forma_pagamento, SUM(valor_pago) AS total_arrecadado
FROM Pagamento
GROUP BY forma_pagamento;
