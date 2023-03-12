# App My Tracks
Esse aplicativo tem como objetivo permitir aos usuários que criem e compartilhem seus “tracks” em tempo real com outros usuários. Cada track contém informações que serão exibidas caso outro usuário selecione ele.

### Recursos
- Usuário poderá criar uma nova conta
- Realizar login
- Visualizar “tracks” de outros users no maps limitando por raio
- Criar track no maps e acompanhar o trajeto em tempo real
- Criar track fora do maps com as estatísticas sendo exibidas em tempo real
- Visualizar estatísticas(tempo, distância, velocidade) do track selecionado no mapa
- Alterar raio para carregamento dos tracks próximos a você

### Arquitetura da aplicação

Foi utilizado o Clean Architecture com monorepo divido em vários micro apps para a construção do app. A vantagem de utilizar esse tipo de arquitetura são:
- Segregação de responsabilidades entre os microapps
- Vários times podem trabalhar em paralelo sem conflitos
- Torna o código mais fácil de manter em projetos grandes
- Rapidez na identificação de recursos para corrigir bugs
- Facilita testes unitários

### Tecnologias usadas

- Dart com Flutter por ser cross platform e ter a curva de aprendizado mais rápida além de ser mais performático que outras tecnologias cross como React Native

- Mobx para gerenciamento de estado por ser de fácil legibilidade, implementação e também é otimizado para ser mais rápido que o bloc e reduz a quantidade de código escrito para fazer determinada controle do estado.

- SharedPreferences: Para armazenar o token do usuário ativo na sessão

- Hive: Banco de dados em forma de mapa para guardar as informações dos tracks realizados em modo offline

- Isolate: Para sincronizar com a cloud os tracks realizados em modo offline. Foi escolhido a abordagem por isolate para não causar travamentos na UI caso esteja sendo executado alguma animação e tenha várias tracks para serem sincronizadas

- Animations: Para tornar o app com uma aparência mais moderna e trabalhar melhor a UX 

### Testes
- Testes unitários sempre serão realizados no controller associado a uma page
- Testes de widgets deverão ser realizados nos componentes do storybook 
