.model small
.code
org 100h
start:
      jmp mulai
nama  db 13,10,'Nama Pembeli : $'
buah  db 13,10,'Ingin Beli Buah ? : $'
berat    db 13,10,'1/2KG, 1 KG, 2 KG ? : $'
lanjut      db 13,10,' Tekan y untuk melanjutkan>>>$'
tampung_nama      db 30,?,30 dup(?)
tampung_buah      db 13,?,13 dup(?)
tampung_berat        db 13,?,13 dup(?)


a db 01
b db 02
c db 03
d db 04
e db 05
f db 06
g db 07
h db 08
i db 09
j db 15

daftar  db 13,10,'^-------------------------------------------------------------^'
        db 13,10,'|                 ~TOKO BUAH FOR FUN~                        |'
        db 13,10,'|~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~|' 
        db 13,10,'+---+-----------+--------------+---------------+--------------|'
        db 13,10,'|No | Jenis Jus |      1/2KG   |      1 KG     |      2 KG    |'
        db 13,10,'+---+-----------+--------------+---------------+--------------|'
        db 13,10,'|01 |   Apel    |   Rp 7.000   |   Rp 14.000   |   Rp 28.000  |'
        db 13,10,'+---+-----------+--------------+---------------+--------------|'
        db 13,10,'|02 |  Alpukat  |   Rp 8.000   |   Rp 16.000   |   Rp 32.000  |'
        db 13,10,'+---+-----------+--------------+---------------+--------------|'
        db 13,10,'|03 |  Jeruk    |   Rp 5.000   |   Rp 10.000   |   Rp 20.000  |'
        db 13,10,'+---+-----------+--------------+---------------+--------------|'
        db 13,10,'|04 |  Naga     |   Rp 7.000   |   Rp 14.000   |   Rp 28.000  |'
        db 13,10,'+---+-----------+--------------+---------------+--------------|'
        db 13,10,'|05 |  Mangga   |   Rp 6.000   |   Rp 12.000   |   Rp 24.000  |'
        db 13,10,'+---+-----------+--------------+---------------+--------------|','$'
       
daftar2 db 13,10,'^------------------------------------------------------------^'
        db 13,10,'|                   ~TOKO BUAH  FOR FUN~                      |'
        db 13,10,'|~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~|' 
        db 13,10,'+---+-----------+--------------+---------------+--------------|'
        db 13,10,'|No | Jenis Jus |      1/2KG   |      1 KG     |      2 KG    |'
        db 13,10,'+---+-----------+--------------+---------------+--------------|'
        db 13,10,'|06 |   Sirsak  |   Rp 7.000   |   Rp 14.000   |   Rp 28.000  |'
        db 13,10,'+---+-----------+--------------+---------------+--------------|'
        db 13,10,'|07 |  Durian   |   Rp 8.000   |   Rp 16.000   |   Rp 32.000  |'
        db 13,10,'+---+-----------+--------------+---------------+--------------|'
        db 13,10,'|08 |  Wortel   |   Rp 5.000   |   Rp 10.000   |   Rp 20.000  |'
        db 13,10,'+---+-----------+--------------+---------------+--------------|'
        db 13,10,'|09 |  Pisang   |   Rp 5.000   |   Rp 10.000   |   Rp 20.000  |'
        db 13,10,'+---+-----------+--------------+---------------+--------------|'
        db 13,10,'|10 | Semangka  |   Rp 6.000   |   Rp 12.000   |   Rp 24.000  |'
        db 13,10,'+---+-----------+--------------+---------------+--------------|','$'
        
        
error         db 13,10,'KODE YANG ANDA MASUKKAN SALAH $'
pilih_ntr     db 13,10,'Silahkan Memilih buah  yang ingin anda beli : $'
success       db 13,10,'Selamat Anda Berhasil $'

     mulai:
     mov ah,09h
     lea dx,nama
     int 21h
     mov ah,0ah
     lea dx,tampung_nama
     int 21h
     push dx
     
     mov ah,09h
     lea dx,buah
     int 21h
     mov ah,0ah
     lea dx,tampung_buah
     int 21h
     push dx
     
     mov ah,09h
     lea dx,berat
     int 21h
     mov ah,0ah
     lea dx,tampung_berat
     int 21h
     push dx
     
     mov ah,09h
     mov dx,offset daftar
     int 21h
     mov ah,09h
     mov dx,offset lanjut
     int 21h
     mov ah,01h
     int 21h
     cmp al,'y'
     je page2
     jne error_nsg
     
page2:
      mov ah,09h
      mov dx,offset daftar2
      int 21h
      mov ah,09h
      mov dx,offset lanjut
      int 21h
      mov ah,01h
      int 21h
      cmp al,'y'
      jmp proses
      jne error_nsg
      
error_nsg:
      mov ah,09h
      mov dx,offset error
      int 21h
      int 20h
      
proses:
      mov ah,09h
      mov dx,offset pilih_ntr
      int 21h
      
      mov ah,1
      int 21h
      mov bh,al
      mov ah,1
      int 21h
      mov bl,al
      cmp bh,'0'
      cmp bl,'1'
      je hasil1
      
      cmp bh,'0'
      cmp bl,'2'
      je hasil2
      
      cmp bh,'0'
      cmp bl,'3'
      je hasil3
      
      cmp bh,'0'
      cmp bl,'4'
      je hasil4 
      
      cmp bh,'0'
      cmp bl,'5'
      je hasil5
      
      cmp bh,'0'
      cmp bl,'6'
      je hasil6
      
      cmp bh,'0'
      cmp bl,'7'
      je hasil7
      
      cmp bh,'0'
      cmp bl,'8'
      je hasil8
      
      cmp bh,'0'
      cmp bl,'9'
      je hasil9
      
      cmp bh,'1'
      cmp bl,'0'
      je hasil10
      
      
      
      jne error_nsg
;-----------------------------'

hasil1:
      mov ah,09h
      lea dx,teks1
      int 21h
      int 20h
hasil2:
      mov ah,09h
      lea dx,teks2
      int 21h
      int 20h
hasil3:
      mov ah,09h
      lea dx,teks3
      int 21h
      int 20h
hasil4:
      mov ah,09h
      lea dx,teks4
      int 21h
      int 20h
hasil5:
      mov ah,09h
      lea dx,teks5
      int 21h
      int 20h
hasil6:
      mov ah,09h
      lea dx,teks6
      int 21h
      int 20h
hasil7:
      mov ah,09h
      lea dx,teks7
      int 21h
      int 20h
hasil8:
      mov ah,09h
      lea dx,teks8
      int 21h
      int 20h
hasil9:
      mov ah,09h
      lea dx,teks9
      int 21h
      int 20h
hasil10:
      mov ah,09h
      lea dx,teks10
      int 21h
      int 20h   
      


;----------------------------------
teks1 db 13,10,'<============================================>'
      db 13,10,'|          anda membeli buah Apel             |'
      db 13,10,'|    1/2 KG harganya   = Rp 7.000             |'
      db 13,10,'|    1 KG harganya     = Rp 14.000            |'
      db 13,10,'|    2 KG harganya     = Rp 28.000            |'
      db 13,10,'|Terima Kasih Sudah Belanja di BUAH FOR FUN   |'
      db 13,10,'<============================================>$' 

teks2 db 13,10,'<============================================>'
      db 13,10,'|        anda membeli buah Alpukat            |'
      db 13,10,'|    1/2 KG harganya  = Rp 8.000              |'
      db 13,10,'|    1 KG  harganya   = Rp 16.000             |'
      db 13,10,'|    2 KG harganya    = Rp 32.000             |'
      db 13,10,'|Terima Kasih Sudah Belanja di BUAH FOR FUN   |'
      db 13,10,'<============================================>$' 
       
teks3 db 13,10,'<============================================>'
      db 13,10,'|        anda membeli buah Jeruk              |'
      db 13,10,'|    1/2 KG harganya = Rp 5.000               |'
      db 13,10,'|    1 KG  harganya  = Rp 10.000              |'
      db 13,10,'|    2 KG harganya   =Rp 20.000               |'
      db 13,10,'|Terima Kasih Sudah Belanja di BUAH FOR FUN   |'
      db 13,10,'<============================================>$' 
       
teks4 db 13,10,'<============================================>'
      db 13,10,'|         anda membeli buah Naga            |'
      db 13,10,'|    1/2 KG harganya  = Rp 7.000            |'
      db 13,10,'|    1 KG  harganya   = Rp 14.000           |'
      db 13,10,'|    2 KG  harganya   = Rp 28.000           |'
      db 13,10,'|Terima Kasih Sudah Belanja di BUAH FOR FUN |'
      db 13,10,'<============================================>$'
      
teks5 db 13,10,'<============================================>'
      db 13,10,'|        anda membeli buah Mangga           |'
      db 13,10,'|     1/2 KG harganya  = Rp 6.000           |'
      db 13,10,'|     1 KG  harganya = Rp 12.000            |'
      db 13,10,'|     2 KG  harganya  = Rp 24.000           |'
      db 13,10,'|Terima Kasih Sudah Belanja di BUAH FOR FUN |'
      db 13,10,'<============================================>$'
      
teks6 db 13,10,'<============================================>'
      db 13,10,'|       anda membeli Buah sirsak            |'
      db 13,10,'|    1/2 KG harganya  = Rp 7.000            |'
      db 13,10,'|    1 KG  harganya = Rp 14.000             |'
      db 13,10,'|    2 KG  harganya  = Rp 28.000            |'
      db 13,10,'|Terima Kasih Sudah Belanja di BUAH FOR FUN |'
      db 13,10,'<============================================>$'  
      
teks7 db 13,10,'<============================================>'
      db 13,10,'|       anda membeli buah Durian            |'     
      db 13,10,'|     1/2 KG harganya  = Rp 8.000           |'
      db 13,10,'|     1 KG  harganya = Rp 16.000            |'
      db 13,10,'|     2 KG  harganya  = Rp 34.000           |'
      db 13,10,'|Terima Kasih Sudah Belanja di BUAH FOR FUN |'
      db 13,10,'<============================================>$'
      
teks8 db 13,10,'<============================================>'
      db 13,10,'|       anda membeli buah Wortel             |'
      db 13,10,'|     1/2 KG harganya  = Rp 5.000            |'
      db 13,10,'|     1 KG  harganya = Rp 10.000             |'
      db 13,10,'|     2 KG  harganya  = Rp 20.000            |'
      db 13,10,'|Terima Kasih Sudah Belanja di BUAH FOR FUN  |'
      db 13,10,'<============================================>$'
      
teks9 db 13,10,'<============================================>'
      db 13,10,'|       anda membeli buah Pisang              |'
      db 13,10,'|     1/2 KG harganya  = Rp 5.000             |'
      db 13,10,'|     1 KG  harganya = Rp 10.000              |'
      db 13,10,'|     2 KG  harganya  = Rp 20.000             |'
      db 13,10,'|Terima Kasih Sudah Belanja di BUAH FOR FUN   |'
      db 13,10,'<============================================>$'   
      
teks10 db 13,10,'<============================================>' 
       db 13,10,'|       anda membeli buah Semangka           |'
       db 13,10,'|     1/2 KG harganya  = Rp 6.000            |'
       db 13,10,'|     1 KG  harganya = Rp 12.000             |'
       db 13,10,'|      2 KG  harganya  = Rp 24.000           |'
       db 13,10,'|Terima Kasih Sudah Belanja di BUAH FOR FUN  |' 
       db 13,10,'<============================================>$'   
      
                                                                                                                                 
                                                                                                                       
      
      
      
end start
      
      
      

                                                                                                                                  
      
      
      
