# Namespacer 🐍
Namespacer é um projeto porte open-source que permite a portabilidade de classes Lua para a plataforma Multi Theft Auto (MTA), **um mod de código aberto para o jogo Grand Theft Auto: San Andreas**. Com Namespacer, é possível criar e utilizar classes em Lua para manipulação de objetos, eventos e outras funcionalidades dentro do MTA. 

## Motivação 👾
O objetivo principal do Namespacer é permitir que desenvolvedores de mods para MTA utilizem a linguagem de programação Lua com mais facilidade e organização, utilizando classes e namespaces para modularizar o código e torná-lo mais legível e reutilizável. Com o Namespacer, é possível definir e utilizar classes em Lua como se estivesse trabalhando em uma linguagem de programação orientada a objetos convencional.

[![MIT License](https://img.shields.io/badge/License-MIT-green.svg)](https://choosealicense.com/licenses/mit/)


## Wiki

**Importando:** O Namespacer é um sistema extenso, portanto, criar tudo em um único arquivo e disponibilizá-lo como um built-in é extremamente desnecessário. Em resumo, você pode usar a função "bundler" e o "loadstring" para realizar uma leitura em massa dentro dos arquivos.

```lua 
loadstring(exports.namespacer:bundler())()
local namespacer = namespacer()
```
<br>

**Classes:** Tudo é simples, no namespacer você cria as classes com palavras chavese e o sistema por detrás faz todo o gerenciamento. Quando você cria um objeto da classe "Carro", ele é uma instância dessa classe e herda todas as propriedades e métodos da classe. Por exemplo, se você criar um objeto "meuCarro", ele terá as propriedades "marca", "modelo", "ano", "cor", e os métodos "ligar", "acelerar", "frear", "trocar de marcha".
```lua
local class = namespacer.class
local public = namespacer.public
local private = namespacer.private

class "Dog" {
    public {
        constructor = function (self, name) 
          self.name = name
        end,
     
        bark = function(self)
            self:bark_sound()
        end,
        
        getName = function (self)
           return self.name
        end
    };

    private {
        bark_sound = function(self)
           print("Au au au au")
        end
    }
}

```

**Introduzindo**: Talvez você precise implementar ou estender alguma outra classe, não é mesmo? Por isso, no namespace, você pode chamar simplesmente a função "extends". Assim, todos os sub-objetos públicos e privados serão herdados sem maiores problemas.
```lua
class "Dono" {

    extends "Dog";

    public {
      getDogName = function (self) 
        self.super.getName()
      end
    };
}


local Dono = namespacer.import("Dono") ()

Dono:getDogName() -- Output: Nome do cachorrinho.
```

<br>

**Inicializando:**  Quando uma nova classe é inicializada, é possível acessar todos os métodos e atributos públicos e protegidos da classe e seus objetos. Os métodos privados só podem ser acessados dentro da própria classe e não são herdados pelas subclasses. Além disso, a palavra "public" não se refere a objetos, mas sim a modificadores de acesso em linguagens de programação orientadas a objetos, indicando que um determinado método ou atributo pode ser acessado de qualquer lugar do código.
```lua
local Dog = namespacer.import("Greeter") ()
Dog:bark("World")
-- Output: Dog barking: AU AU AU

Dog:bark_sound("World")
-- Output: Erro, você não pode acessar metodos privados :p
```


<br>

Operadores:  O Porte Namespacer também possui uma serie de operadores logicos que podem ser usados durante uma class, é importante saber que nem sempre você precisará usar operadores logicos durante uma class, mas sempre que preciso, elees estão la :p

- __add -- Adição
- __sub -- Subtração
- __mul -- Multiplicação
- __div -- Divisão
- __concat -- Concatenação
- __unm -- Enumerate
- __tostring -- Para texto
- __call -- Chamada

```lua
class "Math" {

    extends "Dog";

    public {
      getValue = function (self, value)
        return value
      end
    }
    
    operators {
      __add = function(self, n2)
        return Math(self.value + n2:getValue())
      end;
    }
}
```

<br>

**Interfaces**: Como dito acima, o Namespacer tem o intuito de permitir a conciliação entre linguagens convencionais e o Lua-MTA. Portanto, nada melhor do que ter funções abstratas e saber como defini-las.
```lua
local class = namespacer.class
local public = namespacer.public
local interface = namespacer.interface
local private = namespacer.private
local implements = namespacer.implements
local abstract_function = namespacer.abstract_function


interface "IBark" {
    bark = abstract_function("self")
}

class "Dog" {
    implements {
      "IBark"
    };


    public {
        constructor = function (self, name) 
          self.name = name
        end,
     
        bark = function(self)
            self:bark_sound()
        end,
        
        getName = function (self)
           return self.name
        end
    };

    private {
        bark_sound = function(self)
           print("Au au au au")
        end
    }
}
```


## Referencias

 - [lua-pie](https://github.com/SvenMarcus)
 - [MTA-Classes](https://wiki.multitheftauto.com/wiki/Useful_Classes)


<br>

## LICENSE
MIT License © [Vítor Ribeiro](https://github.com/flashiie)
