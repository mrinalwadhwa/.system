How to easily paper backup/recover secrets ...

````
# get the deps you need
> brew install qrencode
> brew install zbar
````

````
> qrencode -o qr.png 'super secret text that could be already gpg encrypted'
````
print qr.png

later when you need the secret back in a computer
take a picture of the printout with the laptop camera,
then input that picture to zbarimg

````
> zbarimg --quiet --raw qpic.jpg
super secret text that could be already gpg encrypted
````
