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


# 매장
Store.create(owner_id: 1, name: "미까페", location: "상도동", beacon_id: [*('a'..'z')].sample(20).join+Time.now.usec.to_s, category: 0, open_time: "01:00", close_time: "05:00")
Store.create(owner_id: 1, name: "회가사르륽", location: "낙성대", beacon_id: [*('a'..'z')].sample(20).join+Time.now.usec.to_s, category: 1, open_time: "11:00", close_time: "05:00")
Store.create(owner_id: 1, name: "맛있는분식", location: "연남동", beacon_id: [*('a'..'z')].sample(20).join+Time.now.usec.to_s, category: 2, open_time: "12:00", close_time: "09:00")
Store.create(owner_id: 2, name: "우마이", location: "강남", beacon_id: [*('a'..'z')].sample(20).join+Time.now.usec.to_s, category: 2, open_time: "01:00", close_time: "15:00")
Store.create(owner_id: 2, name: "가라아게", location: "성수동", beacon_id: [*('a'..'z')].sample(20).join+Time.now.usec.to_s, category: 2, open_time: "01:00", close_time: "18:00")
Store.create(owner_id: 2, name: "호나우두", location: "서울숲", beacon_id: [*('a'..'z')].sample(20).join+Time.now.usec.to_s, category: 4, open_time: "04:00", close_time: "15:00")
Store.create(owner_id: 3, name: "맥도날두", location: "용산역", beacon_id: [*('a'..'z')].sample(20).join+Time.now.usec.to_s, category: 3, open_time: "06:00", close_time: "05:00")
Store.create(owner_id: 3, name: "치킨나라", location: "여의도", beacon_id: [*('a'..'z')].sample(20).join+Time.now.usec.to_s, category: 4, open_time: "10:00", close_time: "17:00")
Store.create(owner_id: 3, name: "까불이", location: "인천", beacon_id: [*('a'..'z')].sample(20).join+Time.now.usec.to_s, category: 5, open_time: "11:00", close_time: "15:00")


# 메뉴
Store.all.count.times do |m|
  Menu.create(store_id: m+1, price: 9000, checked_menu: true, quick_menu: true, foodglossary_id: 3000, foodstuff_id: 1, foodstuff_id_2: 2, taste_id: 3, cookingmethod_id: 4)
  Menu.create(store_id: m+1, price: 5000, checked_menu: true, quick_menu: true, foodglossary_id: 100, foodstuff_id: 2, foodstuff_id_2: 1, taste_id: 1, cookingmethod_id: 1)
  Menu.create(store_id: m+1, price: 4000, checked_menu: true, quick_menu: true, foodglossary_id: 1000, foodstuff_id: 1, foodstuff_id_2: 2, taste_id: 2, cookingmethod_id: 2)
  Menu.create(store_id: m+1, price: 2000, checked_menu: true, quick_menu: true, foodglossary_id: 2000, foodstuff_id: 4, foodstuff_id_2: 3, taste_id: 3, cookingmethod_id: 3)
end