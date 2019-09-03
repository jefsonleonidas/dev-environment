### GIT ###

**Baixar alterações do repositório**

```console
$ git fetch <repo>
$ git fetch origin
```

Criar branch para funcionalidade com repositório atualizado
```console
$ git checkout origin/develop -b <nome_branch>
$ git checkout origin/develop -b spec_router_420W	
```

Adicionar arquivos
```console
$ git add <arquivo1> <arquivo2> ...
```

Criar commit
```console
$ git commit
```

Corrigir último commit
```console
git commit --amend
```

Fazer build

```console
$ mvn clean install -Ddockerfile.skip -pl '!fkcp-commons/fkcp-frontend-service,!fkcp-docker'
```

Enviar alterações:
```console
$ git rebase origin/develop
$ git push origin HEAD:refs/for/develop%topic=<nome_topico>
$ git push origin HEAD:refs/for/develop%topic=BDSPM-409_Twigs_ONU100
```

#### Checkout do repositório remoto ####
```console
$ git checkout origin/develop
```

### Diff arquivos staged ###
```console
$ git diff --staged
```

### Branch

Criar branch do estado atual
```console
$ git branch "Nome da branch"
```

Criando uma branch a partir do develop
```console
$ git checkout -b "Nome da branch"
```

Apagar branch
```console
$ git branch -D <nome da branch>
```

Ordenar branch por data:
```console
$ git for-each-ref --sort=-committerdate refs/heads/
```

**Ver apenas o nome dos arquivos alterados no último commit**
```console
$ git log --name-only
```

**For full path names and status of changed files**
```console
git log --name-status
```

**For abbreviated pathnames and a diffstat of changed files**
```console
git log --stat
```

### Refazer commit ###

Resetar último commit:
```console
$ git reset --soft HEAD^
```

Se der problema de ambiguidade:

Resetar último commit:
```console
$ git reset --soft 'HEAD^1'
```

Remover arquivos:
```console
$ git reset HEAD path/to/unwanted_file
```

Retornar mensagem do commit:
```console
$ git commit -c ORIG_HEAD
```

### Juntar commits ###

Squash de commits:
```console
$ git rebase -i HEAD~<number commits>
$ git rebase -i HEAD~7
```

git commit --amend

Voltar arquivo para determinado commit:
git checkout <hash commit> -- <file1> <file2>

Exemplo:
git checkout a6587d7e0c12138df6a102c063d58b86070fdb48 -- fkcp-planrepository/fkcp-planrepository-service/src/main/resources/template/gpon/G4S_G8S_G2500/common/dba-profile.create.exec.twig

### Stash ###

Salvar stash com nome:
```console
$ git stash save "nome que quiser para stash"
```

Excluindo uma stash:
```console
$ git stash drop stash@{<índice da stash>}
$ git stash drop stash@{1}
```

Verificar commit:
$ git show <hashCommit>

Exemplo:
$ git show 8a81806c2a95acaeb535099ff0193ce953af51ea

Baixar arquivos repositório:
$ git pull origin master

Exemplos de envio:

$ git push origin HEAD:refs/for/develop%topic=BDSPM-87-Correcao_RouterL3DataService

git push origin HEAD:refs/for/develop%topic=BDSPM-409_Apply_plan_LD3032_ONU100

git push origin HEAD:refs/for/develop%topic=	
Updated_router_entity

$ git push origin HEAD:refs/for/develop%topic=ColecaoBasica

$ git push origin HEAD:refs/for/develop%topic=BDSPM-287-Criacao_de_DBA_nao_utiliza_diretiva_assured

git push origin HEAD:refs/for/develop%topic=ColecaoBasica

Outros comandos git menos utilizados:

Ver arquivos modificados no último commit:
git diff-tree --no-commit-id --name-only -r <commit-ish>

Exemplo:
git diff-tree --no-commit-id --name-only -r 5b431f113480f88c29c1fffee3d66183784ce584

### Merge Conflict ###

Baixar commit: patch do commit(gerrit)

desfazer o commit -  - verificar

```console
$ git reset soft^1
```

Salvar no stash
```console
$ git stash save
```

Fazer checkout no develop
```console
$ git checkout origin/develop
```

Aplica a stash do commit
```console
$ git apply stash stash{identificador}
```
Se houver conflito
```console
$ git mergetool
```

Remover arquivos .orig
```console
$ rm files.orig
```

Reenviar 
```console
$ git push origin HEAD:refs/for/develop%topic=<nome_topico>
```
