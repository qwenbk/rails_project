if (u1 = User.find_by_email('admin@localhost')).nil?
  u1 = User.create!(password: 'qwerty', password_confirmation: 'qwerty',
    email: 'admin@localhost')
  u1.activate!
end
if (u2 = User.find_by_email('oper@localhost')).nil?
  u2 = User.create!(password: 'qwerty', password_confirmation: 'qwerty',
    email: 'oper@localhost')
  u2.activate!
end
r1, r2 = Role.create_main_roles
ru1 = RoleUser.create(role: r1, user: u1)
ru2 = RoleUser.create(role: r2, user: u2)

p1 = Patient.create!(second_name: 'test', first_name: 'test', last_name: 'test',
number: '1', number_polis: '123', is_platnik: true, data_created: '2017.05.17',
index: '123', town: 'москва', street: 'нет', house: '1', corpus: 'нет', flat: 'нет',
issued_by: 'властью', telefone: 'нет', seria: '1111', nomer: '111111',
date_of_issue: '2016.05.01', allergy: 'Отсутствуют')
p2 = Patient.create!(second_name: 'test1', first_name: 'test1', last_name: 'test1',
number: '1', number_polis: '123', is_platnik: true, data_created: '2017.05.17',
index: '123', town: 'москва', street: 'нет', house: '1', corpus: 'нет', flat: 'нет',
issued_by: 'властью', telefone: 'нет', seria: '2222', nomer: '222222',
date_of_issue: '2016.05.01', allergy: 'Отсутствуют')
p3 = Patient.create!(second_name: 'test2', first_name: 'test2', last_name: 'test2',
number: '1', number_polis: '123', is_platnik: true, data_created: '2017.05.17',
index: '123', town: 'москва', street: 'нет', house: '1', corpus: 'нет', flat: 'нет',
issued_by: 'властью', telefone: 'нет', seria: '3333', nomer: '333333',
date_of_issue: '2016.05.01', allergy: 'Отсутствуют')

w1= Ward.create!(floor: '1', number: '1', departmen: 'терапевтическое', capacity: '10')
w2= Ward.create!(floor: '1', number: '2', departmen: 'терапевтическое', capacity: '5')
w3= Ward.create!(floor: '1', number: '3', departmen: 'терапевтическое', capacity: '7')

h1= HospitalStayList.create!(patient: p1, receipt_date: '2017-05-09', reason: 'ОРВИ',
discharge_date: '2017-05-11', discharge_epicrisis: 'нет', ward: w1)
h2= HospitalStayList.create!(patient: p2, receipt_date: '2017-05-08', reason: 'ОРЗ',
discharge_date: '2017-05-10', discharge_epicrisis: 'нет', ward: w1)
h3= HospitalStayList.create!(patient: p3, receipt_date: '2017-05-07', reason: 'Бронхит',
discharge_date: '2017-05-19', discharge_epicrisis: 'нет', ward: w2)
h4= HospitalStayList.create!(patient: p1, receipt_date: '2017-05-06', reason: 'ГРИПП',
discharge_date: '2017-05-10', discharge_epicrisis: 'нет', ward: w3)
