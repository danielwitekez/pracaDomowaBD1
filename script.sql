-- Tabela: Funkcjonariusz
CREATE TABLE Funkcjonariusz (
  id_funkcjonariusza INT PRIMARY KEY,
  imie VARCHAR(255),
  nazwisko VARCHAR(255),
  stopien VARCHAR(50),
  numer_legitymacji INT
);

-- Tabela: Jednostka
CREATE TABLE Jednostka (
  id_jednostki INT PRIMARY KEY,
  nazwa VARCHAR(100),
  lokalizacja VARCHAR(255)
);

-- Tabela: Sprawa
CREATE TABLE Sprawa (
  id_sprawy INT PRIMARY KEY,
  opis TEXT,
  status VARCHAR(50),
  id_jednostki INT,
  FOREIGN KEY (id_jednostki) REFERENCES Jednostka(id_jednostki)
);

-- Tabela: Dowód
CREATE TABLE Dowod (
  id_dowodu INT PRIMARY KEY,
  opis TEXT,
  id_sprawy INT,
  FOREIGN KEY (id_sprawy) REFERENCES Sprawa(id_sprawy)
);

-- Tabela: Przestępca
CREATE TABLE Przestepca (
  id_przestepcy INT PRIMARY KEY,
  imie_nazwisko VARCHAR(255),
  pseudonim VARCHAR(100),
  id_sprawy INT,
  FOREIGN KEY (id_sprawy) REFERENCES Sprawa(id_sprawy)
);

-- Tabela: Aresztowanie
CREATE TABLE Aresztowanie (
  id_aresztowania INT PRIMARY KEY,
  id_funkcjonariusza INT,
  id_przestepcy INT,
  id_sprawy INT,
  data_aresztowania DATE,
  FOREIGN KEY (id_funkcjonariusza) REFERENCES Funkcjonariusz(id_funkcjonariusza),
  FOREIGN KEY (id_przestepcy) REFERENCES Przestepca(id_przestepcy),
  FOREIGN KEY (id_sprawy) REFERENCES Sprawa(id_sprawy)
);

-- Tabela: Miejsce
CREATE TABLE Miejsce (
  id_miejsca INT PRIMARY KEY,
  nazwa_miejsca VARCHAR(255),
  opis TEXT
);

-- Tabela: Patrol
CREATE TABLE PatroL (
  id_patrolu INT PRIMARY KEY,
  id_funkcjonariusza INT,
  data_patrolu DATE,
  FOREIGN KEY (id_funkcjonariusza) REFERENCES Funkcjonariusz(id_funkcjonariusza)
);

-- Tabela: Wykroczenie
CREATE TABLE Wykroczenie (
  id_wykroczenia INT PRIMARY KEY,
  opis TEXT,
  id_sprawy INT,
  FOREIGN KEY (id_sprawy) REFERENCES Sprawa(id_sprawy)
);

-- Tabela: Ofiara
CREATE TABLE Ofiara (
  id_ofiary INT PRIMARY KEY,
  imie_nazwisko VARCHAR(255),
  id_sprawy INT,
  FOREIGN KEY (id_sprawy) REFERENCES Sprawa(id_sprawy)
);

-- Tabela: Poszukiwany
CREATE TABLE Poszukiwany (
  id_poszukiwanego INT PRIMARY KEY,
  imie_nazwisko VARCHAR(255),
  nagroda FLOAT
);

-- Tabela: Nagroda
CREATE TABLE Nagroda (
  id_nagrody INT PRIMARY KEY,
  id_poszukiwanego INT,
  kwota FLOAT,
  FOREIGN KEY (id_poszukiwanego) REFERENCES Poszukiwany(id_poszukiwanego)
);

-- Tabela: Interwencja
CREATE TABLE Interwencja (
  id_interwencji INT PRIMARY KEY,
  id_sprawy INT,
  id_funkcjonariusza INT,
  data_interwencji DATE,
  FOREIGN KEY (id_sprawy) REFERENCES Sprawa(id_sprawy),
  FOREIGN KEY (id_funkcjonariusza) REFERENCES Funkcjonariusz(id_funkcjonariusza)
);
