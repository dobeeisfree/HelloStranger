# 랜덤으로 테스트

# Taste
t_kor = %w(짜다 싱겁다 달다 맵다)
t_eng = %w(Salty Not-Salty Sweet Spicy)
t_jpn = %w(織り 淡い 甘い 辛い)
t_chn = %w(编织 淡 称重 辣)

4.times { Taste.create(kor: t_kor.sample, eng: t_eng.sample, jpn: t_jpn.sample, chn: t_chn.sample, checked: false) }

# foodstuff
f_kor = %w(돼지고기 달걀 우유)
f_eng = %w(Pork Egg Milk Flour)
f_jpn = %w(豚肉 卵 牛乳 小麦粉)
f_chn = %w(猪肉 鸡蛋 牛奶 面粉)

4.times { Foodstuff.create(kor: f_kor.sample, eng: f_eng.sample, jpn: f_jpn.sample, chn: f_chn.sample, checked: false) }

# cookingmethod
c_kor = %w(삶음 볶음 굽기 튀기기)
c_eng = %w(Boil Stir-Fry Roast Fry)
c_jpn = %w(沸騰 炒め 書き込み 揚げる)
c_chn = %w(耙 轰动 烤 油炸)

4.times { Cookingmethod.create(kor: c_kor.sample, eng: c_eng.sample, jpn: c_jpn.sample, chn: c_chn.sample, checked: false) }






# 오너
Owner.create(email: "j@j.com", password: "123123", name: "줍이", contact_number: "212321")
Owner.create(email: "s@s.com", password: "123123", name: "세지니", contact_number: "212321")
Owner.create(email: "h@h.com", password: "123123", name: "호준", contact_number: "212321")
