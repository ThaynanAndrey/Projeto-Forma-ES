module cines

sig Usuario {
	ingressos: set Ingresso
}

sig Ingresso {
	filmeReservado: one Filme
}

sig Filme {
	sessoes: set Sessao
}

sig Sessao {
	sala: one Sala
}

sig Sala {
	cadeiras: set Cadeira
}

sig Cadeira {}


-------------------------------- FATOS -----------------------------

fact invariantes  {
	all s: Sala | one s.~sala
	all s: Sessao | one s.~sessoes
	all i: Ingresso | one i.~ingressos
	all c: Cadeira | one c.~cadeiras
	all f: Filme | #(f.sessoes) <= 2 && #(f.sessoes) > 0
	all s: Sala | #(s.cadeiras) = 2
	all f: Filme | #(f.~filmeReservado) <= 2
}

pred main [] {}

run main for 8 but exactly 3 Usuario
