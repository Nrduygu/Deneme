###  GitHub ile Fonksiyon Oluþturma  ### 

# Öncelikle iki deðiþkenimizin olduðunu düþünelim. Bu deðiþkenlere iliþkin regersyon modeli kurmak ve regresyon modelinin çýktýsýný almak istiyorum diyelim.
# Regresyon modeli için bir fonksiyon yazabilirz. Böylece bu fonksiyonun içeriðine ne eklersek ekleyelim regresyona verilen isim yazýldýðýnda çýktý dosyasý karþýmýza gelir. 
# Öncelikle regresyon ailiþkin fonksiyon oluþtururken bilmeyenler için "lmtest" paketi aktif hale getirilmemiþ olabilir. Bu nednele fonksiyonun içerisine
# if döngüsü oluþturarak "lmtest" paketi aktif deðil ise aktif et komutunu vermiþ oluyoruz. Benzer þekilde otokorelasyon varsayýmýný test etmek için de "dwtest"i de ekleyerek
# iþlemlerimizi otomatik hale getirebiliriz. 

x1= c( 1,4,5,6,7,8,8)
y= c(2,5,8,7,4,6,9)

model_f = function(y,x1){
  regresyon = lm(y~x1)
  model = summary(regresyon)
  model
  
  if(!require(lmtest)){install.packages("lmtest")
    require(lmtest)
  }
  t_1 = dwtest(regresyon)
  sonuc = list(model, t_1)
  return(sonuc)
}
model_f(y,x1)

# Çýktý sonuçlarýnda liste halinde oluþturduðum sonuçlarýn vermiþ olduðum herhangi bir isimle görülmesini istiyorsam ise þu þekilde gösterebilirim;

x1= c( 1,4,5,6,7,8,8)
y= c(2,5,8,7,4,6,9)

model_f = function(y,x1){
  regresyon = lm(y~x1)
  model = summary(regresyon)
  model
  if(!require(lmtest)){install.packages("lmtest")
    require(lmtest) }
  t_1 = dwtest(regresyon)
  sonuc = list("regresyon" = model, "Durbin" = t_1)
  return(sonuc) }
model_f(y,x1)

# böylelikle regresyon çýktýsýnda otokorelasyon test sonucunuda görmüþ oluruz. Bu þekilde deðiþenj varyans, normallik tetslerini de ekleyebiliriz. 