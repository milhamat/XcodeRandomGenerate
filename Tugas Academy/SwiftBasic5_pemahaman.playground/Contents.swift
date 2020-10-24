//Classes

class Kulkas {
    var suhu: Float = 7.0
    var cahaya: Bool = false
    var minuman = [String]()
    var makanan = [String]()
    var warna: String // sebagai deklarasi inisial
    
    init(warna: String){
        self.warna = warna
    }
    
    func diDalamKulkas(){
        print(minuman)
        print(makanan)
    }
    
    func naikinSuhu(){
        suhu = suhu + 1.0// tidak mau dengan menggunakan suhu += 1.0
    }
    
    func nuruninSuhu(){
        suhu = suhu - 1.0
    }
    
    func tampilSuhu(){
        print("suhu kulkas \(suhu)°C")
    }
    
    func lampu(kondisi: String){
        if kondisi == "Buka" {
            cahaya = true
            print("lampu kulkas menyala")
        }
        else if kondisi == "Tutup" {
            cahaya = false
            print("lampu kulkas mati")
        }
        }
}
//----------------KULKAS-MERAH-------------------
print("----------------KULKAS-MERAH-------------------")
var kulkasSatu: Kulkas = Kulkas(warna: "Merah")
print(kulkasSatu.warna)

kulkasSatu.minuman = ["pepsi","coca cola","susu coklat"]
kulkasSatu.makanan = ["tahu","roti","bakso","bakpao"]
print(kulkasSatu.makanan)
print(kulkasSatu.minuman)

kulkasSatu.lampu(kondisi: "Buka")
// ini juga di dalam fungsi sudah ada comand print!!!!!! "print(kulkasSatu.lampu)" SALAH!!!!!!

kulkasSatu.naikinSuhu()
kulkasSatu.naikinSuhu()
kulkasSatu.tampilSuhu()
// salah orang di dalam fungsinya sudah ada ststment print minta di print lagi "print(kulkasSatu.tampilSuhu)" SALAH!!!!!!!

kulkasSatu.nuruninSuhu()
kulkasSatu.tampilSuhu()
//----------------KULKAS-HIJAU-------------------
print("----------------KULKAS-HIJAU-------------------")
var kulkasDua: Kulkas = Kulkas(warna: "Hijau")
print(kulkasDua.warna)

kulkasDua.minuman = ["milo","pepsi","yakult","susu mbok darmi"]
kulkasDua.makanan = ["mie goreng","mie ayam","tahu tek","lontong sayur"]
kulkasDua.diDalamKulkas()// jangan lupa "()" pada tiap fungsi 
//FORMAT: calass_name.Func_name() atau initial_calss_name.Func_name()
kulkasDua.lampu(kondisi: "Tutup")

kulkasDua.nuruninSuhu()
kulkasDua.tampilSuhu()


