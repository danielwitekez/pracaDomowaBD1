-- Tabela: Funkcjonariusz
CREATE TABLE Funkcjonariusz (
  id_funkcjonariusza NUMBER PRIMARY KEY,
  imie VARCHAR(255),
  nazwisko VARCHAR2(255),
  stopien VARCHAR2(50),
  numer_legitymacji NUMBER
);

-- Tabela: Jednostka
CREATE TABLE Jednostka (
  id_jednostki NUMBER PRIMARY KEY,
  nazwa VARCHAR2(100),
  lokalizacja VARCHAR(255)
);

-- Tabela: Sprawa
CREATE TABLE Sprawa (
  id_sprawy NUMBER PRIMARY KEY,
  opis TEXT,
  status VARCHAR(50),
  id_jednostki NUMBER,
  FOREIGN KEY (id_jednostki) REFERENCES Jednostka(id_jednostki)
);

-- Tabela: Dowód
CREATE TABLE Dowod (
  id_dowodu NUMBER PRIMARY KEY,
  opis TEXT,
  id_sprawy NUMBER,
  FOREIGN KEY (id_sprawy) REFERENCES Sprawa(id_sprawy)
);

-- Tabela: Przestępca
CREATE TABLE Przestepca (
  id_przestepcy NUMBER PRIMARY KEY,
  imie_nazwisko VARCHAR2(255),
  pseudonim VARCHAR2(100),
  id_sprawy NUMBER,
  FOREIGN KEY (id_sprawy) REFERENCES Sprawa(id_sprawy)
);

-- Tabela: Aresztowanie
CREATE TABLE Aresztowanie (
  id_aresztowania NUMBER PRIMARY KEY,
  id_funkcjonariusza NUMBER,
  id_przestepcy NUMBER,
  id_sprawy NUMBER,
  data_aresztowania DATE,
  FOREIGN KEY (id_funkcjonariusza) REFERENCES Funkcjonariusz(id_funkcjonariusza),
  FOREIGN KEY (id_przestepcy) REFERENCES Przestepca(id_przestepcy),
  FOREIGN KEY (id_sprawy) REFERENCES Sprawa(id_sprawy)
);

-- Tabela: Miejsce
CREATE TABLE Miejsce (
  id_miejsca NUMBER PRIMARY KEY,
  nazwa_miejsca VARCHAR2(255),
  opis TEXT
);

-- Tabela: Patrol
CREATE TABLE PatroL (
  id_patrolu NUMBER PRIMARY KEY,
  id_funkcjonariusza NUMBER,
  data_patrolu DATE,
  FOREIGN KEY (id_funkcjonariusza) REFERENCES Funkcjonariusz(id_funkcjonariusza)
);

-- Tabela: Wykroczenie
CREATE TABLE Wykroczenie (
  id_wykroczenia NUMBER PRIMARY KEY,
  opis TEXT,
  id_sprawy NUMBER,
  FOREIGN KEY (id_sprawy) REFERENCES Sprawa(id_sprawy)
);

-- Tabela: Ofiara
CREATE TABLE Ofiara (
  id_ofiary NUMBER PRIMARY KEY,
  imie_nazwisko VARCHAR2(255),
  id_sprawy NUMBER,
  FOREIGN KEY (id_sprawy) REFERENCES Sprawa(id_sprawy)
);

-- Tabela: Poszukiwany
CREATE TABLE Poszukiwany (
  id_poszukiwanego NUMBER PRIMARY KEY,
  imie_nazwisko VARCHAR2(255),
  nagroda FLOAT
);

-- Tabela: Nagroda
CREATE TABLE Nagroda (
  id_nagrody NUMBER PRIMARY KEY,
  id_poszukiwanego NUMBER,
  kwota FLOAT,
  FOREIGN KEY (id_poszukiwanego) REFERENCES Poszukiwany(id_poszukiwanego)
);

-- Tabela: Interwencja
CREATE TABLE Interwencja (
  id_interwencji NUMBER PRIMARY KEY,
  id_sprawy NUMBER,
  id_funkcjonariusza NUMBER,
  data_interwencji DATE,
  FOREIGN KEY (id_sprawy) REFERENCES Sprawa(id_sprawy),
  FOREIGN KEY (id_funkcjonariusza) REFERENCES Funkcjonariusz(id_funkcjonariusza)
);
