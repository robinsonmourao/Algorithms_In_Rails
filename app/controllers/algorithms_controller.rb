class AlgorithmsController < ApplicationController

    # def index
    #     returns(@value)
    #     render :returns
    # end

    def lists
        @name = "Robinson"

        @possui_son = @name.include? "son"
        @nome_letra_inicial = @name[0]

        @output=[@possui_son, @nome_letra_inicial]
    end

    def returns

        #      = params[:<valor inserido no formulario>]
        @value = params[:value]        

        @palindromo = eh_palindromo(@value)
        @maior_idade = maior_de_idade(@value)
    end

    def eh_palindromo(value)

        if value.nil? || value.strip.empty?
            return "Favor inserir algum valor!"
          end

        value = value.to_s
        @tamanho_valor = value.length

        if eh_par(value)
            @primeira_parte = value[0, @tamanho_valor/2]
            @segunda_parte = value[@tamanho_valor/2, @tamanho_valor]
        else
            @primeira_parte = value[0, (@tamanho_valor/2)]
            @segunda_parte = value[@tamanho_valor/2+1, @tamanho_valor]
        end

        if (@primeira_parte==@segunda_parte.reverse)
            return true
        else
            return false
        end
    end

    def maior_de_idade(value)

        if value.nil? || value.strip.empty?
            return "Favor inserir algum valor!"
        end

        value = value.to_i
        if (value<18)
            return "Usuário ainda é menor de idade!"
        else
            return "Usuário é maior de idade"
        end
    end
    

    private

    def eh_par(value)
        value = value.to_s
        return (value.length%2)==0
    end
end