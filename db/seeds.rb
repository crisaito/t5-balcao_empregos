coca = Company.create(name: "Coca", description: "Um dos sabores mais reconhecidos no 
                      mundo nasceu na cidade de Atlanta, estado da Georgia, nos Estados Unidos.", 
                      address: "Itupeva", cnpj: "45000000000", website: "www.coca.com.br", 
                      linkedin: "www.linkedin.com/company/coca")
coca.logo.attach(io: File.open(Rails.root.join('public', 'images', 'coca.jpg')), filename: 'coca.jpg')
Recruiter.create(email: "ana@coca.com.br", password: "123456", company: coca)
Job.create(title: 'Senior developer', description: 'Principais Atividades: 
            Desenvolver serviços web funcionais utilizando HTML5, 
            FluentUI, Node.js, Ruby on Rails, React', 
            compensation: '10000', experience_level: 'Senior', 
            requirements: 'Foco em performance, Ruby on Rails', 
            expiration_date: '21/02/2022',
            total_jobs:'5', company: coca)
Job.create(title: 'Supervisor T.I.', description: 'Definir escopos com clientes
            e fornecedores, implementar soluções junto com o time de
            desenvolvimento, definir calendários', 
            compensation: '15000', experience_level: 'senior', 
            requirements: 'Formação superior completa em TI', 
            expiration_date: '10/05/2022',
            total_jobs:'1', company: coca)
                 
pepsico = Company.create(name: 'Pepsi', description: 'O produto que deu origem à marca 
                          de refrigerantes Pepsi-Cola foi criado no ano de 1893, no estado 
                          da Carolina do Norte nos Estados Unidos', 
                          address: 'São Paulo, SP', cnpj: '31565104000177', 
                          website: 'www.pepsico.com.br', 
                          linkedin: 'www.linkedin.com/company/pepsico')
pepsico.logo.attach(io: File.open(Rails.root.join('public', 'images', 'pepsi.jpg')), filename: 'pepsi.jpg')
Recruiter.create(email: "bia@pepsi.com.br", password: "123456", company: pepsico)
Job.create(title: 'Analista de desenvolvimento', description: 'Desenvolverá funcionalidades 
            e soluções para os mais diversos sistemas dentro da empresa.',
            compensation: '8525', experience_level: 'Pleno', 
            requirements: 'Ter graduação em Engenharia de Computação, 
            Ciência da Computação ou áreas relacionadas', 
            expiration_date: '1/10/2021',
            total_jobs:'2', company: pepsico)
            
guarana = Company.create(name: 'Guarana', description: 'Guaraná é um refrigerante 
                          feito à base de fruta do guaraná', 
                          address: 'Manaus, AM', cnpj: '12300000756233', 
                          website: 'www.guarana.com.br', 
                          linkedin: 'www.linkedin.com/company/guarana')
guarana.logo.attach(io: File.open(Rails.root.join('public', 'images', 'guarana.jpg')), filename: 'guarana.jpg')
Recruiter.create(email: "bia@guarana.com.br", password: "123456", company: guarana)
Job.create(title: 'Analista de Desenvolvimento de Software', description: 'Implementar soluções que 
            atendam os requisitos de negócio priorizando qualidade e prazos.', compensation: '15000', 
            experience_level: 'Pleno', requirements: 'Kubernetes, TDD/BDD, Ruby on Rails', 
            expiration_date: '10/06/2021',
            total_jobs:'3', company: guarana)

Candidate.create(email: "cristiane@gmail.com.br", password: "123456", full_name: 'Cris Saito', tel: '999 123 123', city: 'São Paulo', state: "SP", bio: "graduação em design")
