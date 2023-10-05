#!/bin/bash

if (( $# > 0 ))
then
    while true
    do
        case "$1" in
        -a)
            echo "Bienvenido a la guía rápida de Agile, para continuar seleccione un tema: "
            echo "1. SCRUM"
            echo "2. X.P"
            echo "3. Kanban"
            echo "4. Crystal"
            read option

            case "$option" in
                1)
                    selectedMethodology=scrum
                ;;
                2)
                    selectedMethodology=xp
                ;;
                3)
                    selectedMethodology=kanban
                ;;
                4)
                    selectedMethodology=crystal
                ;;
                *)
                    echo "No es una opcion valida"
                ;;                                
                esac

                echo "Usted esta en la sección $selectedMethodology, seleccione la opción que desea utilizar."
                echo "1. Agregar información"
                echo "2. Buscar"
                echo "3. Eliminar información"
                echo "4. Leer base de información"

                read action

                if(( action == 1 ))
                then
                    echo "Introduzca el nombre del concepto que deseas guardar en $selectedMethodology: "
                    read nameOfConcept
                    echo "Introduzca la definicion del concepto $nameOfConcept"
                    read definitionOfTheConcept
                    echo "[$nameOfConcept] .- $definitionOfTheConcept" >> "$selectedMethodology.inf"
                fi

                if((action == 2))
                then
                    echo "Introduzca el concepto que desea buscar en $selectedMethodology"
                    read concept
                    definition=$(grep "\[$concept\]" "$selectedMethodology.inf")
                    if [ -z "$definition" ]
                    then
                        echo "El concepto no existe (por ahora...)"
                    fi
                    echo $definition
                fi

                if((action == 3))
                then
                    echo "Introduzca el concepto que desea eliminar en $selectedMethodology"
                    read concept
                    lineToDelete=$(grep -n "\[$concept\]" "$selectedMethodology.inf") # -n regresa el numero de linea
                    conceptToDelete=$(echo "$lineToDelete" | cut -d: -f1)

                    if [ -z "$conceptToDelete" ] # verificar si la linea esta vacia con el flag -z
                    then 
                        echo "El concepto no existe"
                    fi

                    sed -i "${conceptToDelete}d" "$selectedMethodology.inf"
                    echo "CONCEPTO $concept ELIMINADO"
                fi

                if (( action == 4 ))
                then
                    if [ -s "$selectedMethodology.inf" ]; then
                        cat "$selectedMethodology.inf"
                    else
                        echo "El archivo esta vacio."
                    fi
                fi
            ;;
        -t)
            echo "Bienvenido a la guía rápida de metodologías tradicionales, para continuar seleccione un tema: "
            echo "1. Cascada"
            echo "2. Espiral"
            echo "3. Modelo V"       
            read option

            case "$option" in
                1)
                    selectedMethodology=cascada
                ;;
                2)
                    selectedMethodology=espiral
                ;;
                3)
                    selectedMethodology=modelov
                ;;
                *)
                    echo "No es una opcion valida"
                    exit 0
                ;;                                
                esac

                echo "Usted esta en la sección $selectedMethodology, seleccione la opción que desea utilizar."
                echo "1. Agregar información"
                echo "2. Buscar"
                echo "3. Eliminar información"
                echo "4. Leer base de información"

                read action

                if(( action == 1 ))
                then
                    echo "Introduzca el nombre del concepto que deseas guardar en $selectedMethodology: "
                    read nameOfConcept
                    echo "Introduzca la definicion del concepto $nameOfConcept"
                    read definitionOfTheConcept
                    echo "[$nameOfConcept] .- $definitionOfTheConcept" >> "$selectedMethodology.inf"
                fi

                if((action == 2))
                then
                    echo "Introduzca el concepto que desea buscar en $selectedMethodology"
                    read concept
                    definition=$(grep "\[$concept\]" "$selectedMethodology.inf")
                    if [ -z "$definition" ]
                    then
                        echo "El concepto no existe (por ahora...)"
                    fi
                    echo $definition
                fi

                if((action == 3))
                then
                    echo "Introduzca el concepto que desea eliminar en $selectedMethodology"
                    read concept
                    lineToDelete=$(grep -n "\[$concept\]" "$selectedMethodology.inf") # -n regresa el numero de linea
                    conceptToDelete=$(echo "$lineToDelete" | cut -d: -f1)

                    if [ -z "$conceptToDelete" ] # verificar si la linea esta vacia con el flag -z
                    then 
                        echo "El concepto no existe"
                    else
                        sed -i "${conceptToDelete}d" "$selectedMethodology.inf"
                        echo "CONCEPTO $concept ELIMINADO"
                    fi
                fi

                if (( action == 4 ))
                then
                    if [ -s "$selectedMethodology.inf" ]; then
                        cat "$selectedMethodology.inf"
                    else
                        echo "El archivo esta vacio."
                    fi
                fi
        ;;
        *)
            echo "No es una opcion valida"
        esac

        echo -e "\nDesea continuar con otra opción? Teclee 'si' para ingresar otra opción"
        read continuar
        if [ "$continuar" != "si" ]
        then
            exit 0
        fi
    done
else 
    echo "No se a introduccido un argumento"
fi