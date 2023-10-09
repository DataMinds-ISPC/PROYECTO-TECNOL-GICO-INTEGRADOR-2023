

##################################################################################
####                                                                          ####
####    Ejecutando este archivo se descargan todos los datasets utilizados    ####
####      en la carpeta donde se encuentra este archivo                       ####
####                                                                          ####
####    Por motivo de compartir las pruebas, se dejan los distintos modelos   ####
####      de prueba de automatización de descarga de las bases de datos       ####
####                                                                          ####
####    El código se puede adaptar perfectamente para descargar/guardar los   ####
####      datasets en una carpeta específica (como se muestra en el tercer    ####
####      modelo) especificando la ruta, o para subir dichos datasets a una   ####
####      base de datos en línea                                              ####
####                                                                          ####
##################################################################################


'''
# Primer modelo, para descargar un achivo usando una librería estándar
# Es el modelo que se terminó utilizando
import urllib.request
url = "https://www.python.org/static/img/python-logo@2x.png"
archivo = "logo_python.png"
urllib.request.urlretrieve(url, archivo)
'''


'''
# Segundo modelo, para descargar un achivo usando una librería externa
import requests
url = "https://www.python.org/static/img/python-logo@2x.png"
archivo = "logo_python.png"
respuesta = requests.get(url)
with open(archivo, "wb") as f:
    f.write(respuesta.content)
'''


'''
# Tercer modelo, con misma librería que antes, especificando una carpeta
import requests
url = "https://population.un.org/wpp/Download/Files/1_Indicators%20(Standard)/EXCEL_FILES/1_Population/WPP2019_POP_F01_1_TOTAL_POPULATION_BOTH_SEXES.xlsx"
carpeta = "datos"
archivo = carpeta + "/poblacion_mundial.xlsx"
respuesta = requests.get(url)
with open(archivo, "wb") as f:
    f.write(respuesta.content)
'''


'''
# Cuarto modelo, para descargar un achivo usando una librería externa
# En este caso emulando el comando wget de Linux
import wget
url = "https://www.python.org/static/img/python-logo@2x.png"
archivo = "logo_python.png"
wget.download(url, archivo)
'''


import urllib.request

url = "https://cancilleria.gob.ar/userfiles/ut/2023-07_presentacion_ica_datos_a_junio.pdf"
archivo = "2023-07_presentacion_ica_datos_a_junio.pdf"
urllib.request.urlretrieve(url, archivo)


url = "https://infra.datos.gob.ar/catalog/sspm/dataset/140/distribution/140.1/download/participacion-principales-socios-comerciales-comercio-argentino-mensual.csv"
archivo = "participacion-principales-socios-comerciales-comercio-argentino-mensual.csv"
urllib.request.urlretrieve(url, archivo)


url = "https://www.economia.gob.ar/download/infoeco/internacional_ied.xlsx"
archivo = "internacional_ied.xlsx"
urllib.request.urlretrieve(url, archivo)


url = "https://infra.datos.gob.ar/catalog/sspm/dataset/338/distribution/338.1/download/flujos-por-centuales-netos-inversion-extranjera-directa.csv"
archivo = "flujos-por-centuales-netos-inversion-extranjera-directa.csv"
urllib.request.urlretrieve(url, archivo)


url = "https://www.indec.gob.ar/ftp/ica_digital/ica_d_09_2343A1E77713/data/cuadros/sunburst_rubros_usos_mensual.xlsx"
archivo = "exportacion_por_rubros_importacion_por_usos_mensual.xlsx"
urllib.request.urlretrieve(url, archivo)


url = "https://www.indec.gob.ar/ftp/ica_digital/ica_d_09_2343A1E77713/data/cuadros/plot_sunburst_comercio_zonas_paises_mensual.xlsx"
archivo = "principales_socios_comerciales.xlsx"
urllib.request.urlretrieve(url, archivo)


url = "https://www.indec.gob.ar/ftp/cuadros/economia/expindices_04.xls"
archivo = "valor_precio_cantidad_exportaciones_importaciones_términos.xls"
urllib.request.urlretrieve(url, archivo)


url = "https://www.indec.gob.ar/ftp/cuadros/economia/sh_opex_principales_grubros_1993_2022.xls"
archivo = "origen_provincial_exportaciones_1993_2022.xls"
urllib.request.urlretrieve(url, archivo)



