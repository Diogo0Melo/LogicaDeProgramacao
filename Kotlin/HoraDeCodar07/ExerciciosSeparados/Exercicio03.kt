package HoraDeCodar07.ExerciciosSeparados

// 3) Com "S" ou com "Z"?

fun menuHospedes() {
    println("MENU HÓSPEDES\n")
    println("1 - Cadastrar Hóspedes; 2 - Pesquisar Hóspede; 3 - Listar Hóspedes; 4 - Voltar ao Menu Principal")
    println("Escolha uma opção: ")
    val opcao = readln().toIntOrNull()
    return when (opcao) {
        1 -> cadastrarHospede()
        2 -> pesquisarHospede()
        3 -> listarHospedes()
        4 -> inicio()
        else -> erroMenuHospedes()
    }
}

fun cadastrarHospede() {
    if (hospedesCadastrados.size >= 15) {
        println("Máximo de cadastros atingido")
        enter()
        return menuHospedes()
    }
    println("Qual o nome do Hóspede? ")
    val nomeHospede = readln()
    if (nomeHospede.isBlank()) {
        println("Nome inválido. Tente novamente.")
        enter()
        return cadastrarHospede()
    } else {
        hospedesCadastrados.add(nomeHospede)
        println("Hóspede $nomeHospede foi cadastrada(o) com sucesso!")
        enter()
        return menuHospedes()
    }
}

fun pesquisarHospede() {
    println("Qual o nome do Hóspede? ")
    val nomePesquisa = readln()
    val resultadoPesquisa: String = hospedesCadastrados.filter { it.equals(nomePesquisa, ignoreCase = true) }.toString()
    if (resultadoPesquisa.isEmpty()) {
        println("Hóspede $nomePesquisa não foi encontrada(o)!")
    } else {
        println("Hóspede $resultadoPesquisa foi encontrada(o)! ")
    }
    enter()
    return menuHospedes()
}

fun listarHospedes() {
    if (hospedesCadastrados.isEmpty()) {
        println("Nenhum hóspede cadastrado.")
    } else {
        println("Hóspedes Cadastrados: ")
        hospedesCadastrados.forEachIndexed { index, nome ->
            println("${index + 1} - $nome")
        }
    }
    enter()
    return menuHospedes()
}

fun erroMenuHospedes(){
    println("Opção inválida. Tente novamente.")
    enter()
    menuHospedes()
}