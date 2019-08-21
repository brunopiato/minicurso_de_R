###################################
#### Curso de Introducao ao R #####
###################################

# -------------------------------------------------------------
#### Secao 1: Introducao a vetores, matrizes e data frames ####
# -------------------------------------------------------------
vetor1 <- c(1, 2, 3, 4, 5) # Para criar um vetor utilizamos a funcao c(). Neste caso criamos um vetor contendo somente valores numericos
vetor1 # Se chamarmos o objeto, ele será lido no console


vetor2 <- c("A", "B","C","D","E") # Agora criamos um vetor contendo somente valores em caracteres
vetor2


dataframe1 <- cbind(vetor1=vetor1, vetor2=vetor2, deparse.level = 1) # Usamos a funcao cbind() para anexar colunas na ordem desejada. Usamos o argumento deparse.level = 1 para que os nomes dos vetores sejam usados como nomes das colunas. Esta funcao pode ser usada tambem para adicionar colunas a um dataframe previamente existente. Usamos os argumentos "vetor1=vetor1" para expressar ao R que a coluna chamada "vetor1" sera ocupada (=) ao objeto chamado "vetor1". Desta forma podemos escolher os nomes das colunas presentes no dataframe
dataframe1
head(dataframe1, 3) # Podemos usar a funcao head() para fazer a leitura somente de uma parte inicial da matrix ou dataframe que temos. Neste caso visualizamos as 3 primeiras linhas
tail(dataframe1, 3) # De maneira analoga a funcao head(), a funcao tail() exibe no console a parte final de uma tabela


data.frame(c(1, 2, 3, 4, 5), c("A", "B", "C", "D", "E")) # Outra maneira de construirmos dataframes é usando a funcao data.frame() e escrevendo os vetores a serem utilizados. Entretanto esta maneira limita a possibilidade de nomear diretamente na funcao as colunas. A funcao matrix() pode ser utilizada para fazer matrizes desta mesma forma. Contudo matrizes sao tabelas contendo exclusivamente dados numericos


rbind(c(1,"A"), c(2,"B"), c(3,"C"), c(4,"D"), c(5,"E")) # Uma terceira maneira de criar dataframes e atraves da funcao rbind(), que anexa linhas na ordem desejada. Podemos usa-la tambem para adicionar novas linhas a um data frame anterior


dataframe1 == data.frame(c(1, 2, 3, 4, 5), c("A", "B", "C", "D", "E")) # Podemos testar logicamente se os resultados dos dataframes criados sao os mesmo atraves dos operadores logicos "==" para igualdade ou "!=" para desigualdade. Neste caso esperamos "TRUE" para todas as celulas caso as tavelas sejam identicas


dataframe1 != rbind(c(1,"A"), c(2,"B"), c(3,"C"), c(4,"D"), c(5,"E")) # Neste caso esperamos "FALSE" para todas as celulas ja que estamos perguntando ao R sobre a desigualdade de duas tabelas identicas


is.matrix(dataframe1)
is.data.frame(dataframe1) # As funcoes is.matrix() e is.data.frame() fazem parte de um conjunto de funcoes de verificacao de classes de objetos no R. Perceba que nosso dataframe "dataframe1" esta sendo lido pelo R como uma matrix. Isto pode gerar alguns problemas futuros em algumas analises. Para resolver este problema utilizaremos a funcao as.data.frame()

as.data.frame(dataframe1) # A funcao as.data.frame() faz parte de um conjunto de funcoes do R utilizadas para conversoes entre diferentes classes de objetos no R. Estas funcoes sao extremamente uteis, ja que tais conversoes sao muito mais comuns do que parecem
class(as.data.frame(dataframe1)) # Agora podemos verificar que a classe de objetos a que o objeto "dataframe1" pertence apos esta transformacao passara a apresentar e data.frame
dataframe1 <- as.data.frame(dataframe1) # Portanto, vamos sobrescrever o objeto "dataframe1" anterior com o mesmo objeto com classe convertida, arrumando nosso problema
str(dataframe1) # Com a funcao str() podemos investigar a estrutura do objeto desejado
summary(dataframe1) # Afuncao summary() permite que tenhamos um resumo do que ha no objeto desejado
ncol(dataframe1) # Conta o numero de colunas
nrow(dataframe1) # Conta o numero de linhas
dim(dataframe1) # Recupera as dimensoes em linhas por colunas da tabela desejada


dataframe1[1,] # Data frames possuem coordenadas como em um jogo de batalha naval, e elas podem ser acessadas por [,] com formato [linha,coluna]. Desta forma, dataframe1[1,] ira exibir no console a primeira linha toda do data frame
dataframe1[,1] # Ao passo que dataframe1[,1] exibira toda a primeira coluna. Esta forma de recrutamento de informacao e fundamental e pode ser utilizada tambem com vetores
dataframe1[4,1] # O valor ocupado na celula presente na 4arta linha e 1eira coluna e o valor 4
vetor1[3] # Esta linha exibira no console o terceiro elemento do vetor "vetor1", que, neste caso, e o valor 3. Esta forma de recrutar informacoes dentro dos objetos permite que sua alteracao seja facil e rapida
vetor1[3] <- 98 # Atribuiremos ao 3 elemento do vetor "vetor1" o valor 98
vetor1 # Verificamos a alteracao
vetor1[3] <- 3 # Alteramos de volta para o valor original
vetor1 # Verificamos a alteracao


class(dataframe1[,1]) # Esta forma de recrutamento de informacao permite, ainda, que utilizemos funcoes diretamente sobre linhas, colunas e elementos dentro dos dataframes e matrizes. Inclusive, neste caso, podemos ver que a coluna 1 do objeto "dataframe1" está sendo interpretada pelo R como contendo caracteres, e nao valores numericos. Isto pode gerar erros futuros, entao vamos corrigir
dataframe1$vetor1 <- as.numeric(dataframe1[,1]) # Vamos converter a primeira coluna para valores numericos
class(dataframe1[,1]) # Verificar a conversao
dataframe1[,1]*3 # Agora que os valores na primeira coluna foram convertidos para valores numericos, podemos utilizar operadores matematicos para realizar calculos e operacoes com os valores dentro das celulas
dataframe1[,1]+3/2 # Podemos realizar operacoes mais longas, lembrando que elas serao conduzidas separadamente com cada um dos elementos deste vetor 
mean(dataframe1[,1]) # Podemos calcular a media desta coluna
median(dataframe1[,1]) # A mediana
sum(dataframe1[,1]) # A soma de todos os elementos
min(dataframe1[,1]) # Minima
max(dataframe1[,1]) # Maxima
sd(dataframe1$vetor1) # A funcao sd() calcula o desvio padrao de um conjunto de dados. Entretanto repare que podemos acessar as colunas de um data frame atraves de seu nome, desde que usemos o operador $ para nos referir a ela


typeof(dataframe1[1,1]) # Podemos verificar especificamente o tipo de dado a que pertence um elemento. Neste caso o valor presente na primeira linha da primeira coluna da tabela "dataframe1" e um "double". Isto significa que ele sera lido pelo R como um numero decimal. Para transforma-lo em integral podemos usar a funcao as.integer()


dataframe1[dataframe1$vetor1>=3,] # Uma tecnica fundamental para a preparacao dos dados para analises e a filtragem e subamostragem de dados de uma tabela. A forma mais facil de fazer isto e atraves do recrutamento seletivo de um dataframe. Nete caso poderiamos ler esta linha de comando como "selecione dentro do objeto 'dataframe1' as linhas que tiverem o valor da coluna 'vetor1' maior ou iguais a 3". Por esta razao colocamos o condicional de filtragem no espaco reservado para as linhas [linhas,], uma vez que e justamente elas que eu quero como resposta. Se quisessemos o oposto, selecionar colunas como resposta de um condicional presente nas linhas, o comando de filtragem deveria estar presente na parte das colunas [,colunas]
dataframe1[dataframe1$vetor1>=3 & dataframe1$vetor1<4,] # Neste caso adicionamos mais um condicional logico. Alem de ser maior ou igual a 3, os valores da coluna "vetor1" devem ser maiores que 4
dataframe1[dataframe1$vetor1!=1 & dataframe1$vetor1!=5,] # Retorna somente as linhas cujos valores da coluna "vetor1" sejam diferentes de 1 e diferentes de 5



colnames(dataframe1) # Esta funcao permite exibir os nomes das colunas de uma tabela e tambem pode ser usada para altera-los
colnames(dataframe1) <- c("Vetor_1", "Vetor_2") # Alteramos os nomes das colunas
colnames(dataframe1) # Verificamos se a alteracao foi realizada
rownames(dataframe1) # A funcao rownames() e o equivalente para linhas da funcao colnames()


gsub(dataframe1[,2], pattern = "B", replacement = "bb") # A funcao gsub() e utilizada para substituir valores dentro da celulas de uma tabela. Para isto ela precisa dos argumentos definindo um vetor a ser examinado, um padrao a ser encontrado e um valor a ser substituido. O resultado pode ser atribuido a um objeto atraves do operador "<-"
dataframe1[,2] <- gsub(dataframe1[,2], pattern = "B", replacement = "bb") # Neste caso inserimos um valor desconhecido "NA" a coluna "vetor2"










save.image("C:/Users/piato/Dropbox/BIOLOGIA/R/MEU CURSO DE R/Material Minicurso Introdução ao R/Scripts/aula/ambiente_aula.RData") # Vamos salvar o ambiente em que trabalhamos ate agora para acessa-lo novamente sem precisar executar todas as linhas novamente. O destino deve ser alterado conforme o diretorio de trabalho de cada um





# -------------------------------------------------------------
#### Secao 2: Graficos com o pacote ggplot2                ####
# -------------------------------------------------------------
load("C:/Users/piato/Dropbox/BIOLOGIA/R/MEU CURSO DE R/Material Minicurso Introdução ao R/Scripts/aula/ambiente_aula.RData") # Vamos carregar o ambiente da secao anterior

# install.packages("ggplot2") # Primeiro passo e fazer o download do pacote que usaremos
library(ggplot2) # O segundo passo e carrega-lo no ambiente do R














save.image("C:/Users/piato/Dropbox/BIOLOGIA/R/MEU CURSO DE R/Material Minicurso Introdução ao R/Scripts/aula/ambiente_aula.RData") # Vamos salvar o ambiente em que trabalhamos


# -------------------------------------------------------------
#### Secao 3: Usando o R Comander para analises            ####
# -------------------------------------------------------------
load("C:/Users/piato/Dropbox/BIOLOGIA/R/MEU CURSO DE R/Material Minicurso Introdução ao R/Scripts/aula/ambiente_aula.RData") # Vamos carregar o ambiente da secao anterior

#install.packages("Rcmd", dependencies = T)
library(Rcmdr)








save.image("C:/Users/piato/Dropbox/BIOLOGIA/R/MEU CURSO DE R/Material Minicurso Introdução ao R/Scripts/aula/ambiente_aula.RData") # Vamos salvar o ambiente em que trabalhamos


# -------------------------------------------------------------
#### Secao 4: Escrevendo funcoes basicas                   ####
# -------------------------------------------------------------
load("C:/Users/piato/Dropbox/BIOLOGIA/R/MEU CURSO DE R/Material Minicurso Introdução ao R/Scripts/aula/ambiente_aula.RData") # Vamos carregar o ambiente da secao anterior


jogar <- function(x, n) { 
  sample(x, n, replace = T)
} # A criacao de funcoes envolve a atribuicao de um nome a nova funcao, a determinacao dos argumentos a serem utilizados pela funcao e o que a funcao deve realizar entre chaves. Neste caso o nome da nova funcao sera "jogar". Ela sera uma funcao que utilizara dois argumentos, "x" e "n" a serem definidos pelo usuario. A funcao "jogar" deve realizar o que esta entre chaves, que neste caso e aplicar a funcao de amostragem aleatoria sample() ao objeto "x" durante "n" vezes com reposicao. Neste caso, a nova funcao que escrevemos e redundante pois a propria funcao sample() ja realiza exatamente esta funcao. Vamos testar nossa funcao abaixo:

dados <- c(1:6) # Vamos criar um objeto que represente nosso dado, um objeto contendo seis elementos numericos sequenciais de 1 ate 6

jogar(dado, 126) # Aplicando a funcao jogar() ao objeto "dado" por 126 repeticoes estamos dizendo ao R que amostre aleatoriamente o objeto "dado" 126 vezes, repondo o valor resultante no objeto. Nossa funcao funciona



jogar.testando <- function(x, n){
  result <- sample(x, n, replace = T)
  ifelse(result>=5, yes=T, no=F)
} # Esta nova funcao propoe algo um pouco diferente. Ela ira amostrar o objeto "x" por "n" vezes, atribuindo os resultados a um vetor chamado "result". Entao ela testara se cada elemento corresponde ao condicional imposto pela funcao ifelse de ser maior ou igual a 5. Se o condicional for verdadeiro, ela retornara o valor logico "TRUE". Se o condicional for falso, ela retornara o valor condicional "FALSE". Vamos testa-la


jogar.testando(dado, 191) # Vamos rodar a aleatorizacao 191 vezes e observar quais resultados sao maiores ou iguais a 5


# Funcoes podem ser extremamente uteis para automatizar processos que, por vezes, precisamos fazer passo a passo. Podemos definir uma funcao que limpe os dados da forma desejada e devolva um objeto já limpo. Ou uma funcao que aplique um determinado teste estatistico aos dados. Ou, ainda, uma funcao que realize todos os graficos para a visualizacao preliminar dos dados. Lembre-se, preguica faz os melhores programadores





save.image("C:/Users/piato/Dropbox/BIOLOGIA/R/MEU CURSO DE R/Material Minicurso Introdução ao R/Scripts/aula/ambiente_aula.RData") # Vamos salvar o ambiente em que trabalhamos


# -------------------------------------------------------------
#### Secao 5:             ####
# -------------------------------------------------------------
load("C:/Users/piato/Dropbox/BIOLOGIA/R/MEU CURSO DE R/Material Minicurso Introdução ao R/Scripts/aula/ambiente_aula.RData") # Vamos carregar o ambiente da secao anterior

















save.image("C:/Users/piato/Dropbox/BIOLOGIA/R/MEU CURSO DE R/Material Minicurso Introdução ao R/Scripts/aula/ambiente_aula.RData") # Vamos salvar o ambiente em que trabalhamos


# -------------------------------------------------------------
#### Secao 6:             ####
# -------------------------------------------------------------
load("C:/Users/piato/Dropbox/BIOLOGIA/R/MEU CURSO DE R/Material Minicurso Introdução ao R/Scripts/aula/ambiente_aula.RData") # Vamos carregar o ambiente da secao anterior





save.image("C:/Users/piato/Dropbox/BIOLOGIA/R/MEU CURSO DE R/Material Minicurso Introdução ao R/Scripts/aula/ambiente_aula.RData") # Vamos salvar o ambiente em que trabalhamos


# -------------------------------------------------------------
#### Secao 7:             ####
# -------------------------------------------------------------
load("C:/Users/piato/Dropbox/BIOLOGIA/R/MEU CURSO DE R/Material Minicurso Introdução ao R/Scripts/aula/ambiente_aula.RData") # Vamos carregar o ambiente da secao anterior





save.image("C:/Users/piato/Dropbox/BIOLOGIA/R/MEU CURSO DE R/Material Minicurso Introdução ao R/Scripts/aula/ambiente_aula.RData") # Vamos salvar o ambiente em que trabalhamos


# -------------------------------------------------------------
#### Secao 8:             ####
# -------------------------------------------------------------
load("C:/Users/piato/Dropbox/BIOLOGIA/R/MEU CURSO DE R/Material Minicurso Introdução ao R/Scripts/aula/ambiente_aula.RData") # Vamos carregar o ambiente da secao anterior






save.image("C:/Users/piato/Dropbox/BIOLOGIA/R/MEU CURSO DE R/Material Minicurso Introdução ao R/Scripts/aula/ambiente_aula.RData") # Vamos salvar o ambiente em que trabalhamos


# -------------------------------------------------------------
#### Secao 9:             ####
# -------------------------------------------------------------
load("C:/Users/piato/Dropbox/BIOLOGIA/R/MEU CURSO DE R/Material Minicurso Introdução ao R/Scripts/aula/ambiente_aula.RData") # Vamos carregar o ambiente da secao anterior






save.image("C:/Users/piato/Dropbox/BIOLOGIA/R/MEU CURSO DE R/Material Minicurso Introdução ao R/Scripts/aula/ambiente_aula.RData") # Vamos salvar o ambiente em que trabalhamos


# -------------------------------------------------------------
#### Secao 10:             ####
# -------------------------------------------------------------
load("C:/Users/piato/Dropbox/BIOLOGIA/R/MEU CURSO DE R/Material Minicurso Introdução ao R/Scripts/aula/ambiente_aula.RData") # Vamos carregar o ambiente da secao anterior

