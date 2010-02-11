#!/usr/bin/ruby -w
# simple.rb - simple MySQL script using Ruby MySQL module
#require "rubygems"
require "mysql"

class Table_reader_constants
	
	def table_reader()
		
		#Ricordati che devi avere tutte le variabili già popolate e visibili qui !!!
		
    @@logger.info('Table_reader_constants.table_reader => ' + $compagnia) {"E' stata richiesta la lettura delle costanti per la compagnia: " + $compagnia}
    @@logger.info('Table_reader_constants.table_reader => ' + $compagnia) {"Profilo assicurativo: "+ $profilo_assicurativo.to_s()}
    @@logger.info('Table_reader_constants.table_reader => ' + $compagnia) {"Profilo anagrafico: "+ $profilo_anagrafico.to_s()}

    begin
      mysql = Mysql.init()
      mysql = Mysql.real_connect($db_ip, $db_conn_user, $db_conn_pwd, "Quixa_technical")

  #    time = Date.today
  #    days_in_month = (Date.new(Time.now.year,12,31) << (12-time.month)).day
  #    start_date = time + days_in_month
      start_date =  $detection_date

      case $compagnia
        when "conTe"
          res = mysql.query("Select * From costanti_conTe")

          while row = res.fetch_hash do
            consumer				= row['nome']			,
            nome					= row['nome']			,
            valore  				= row['valore']

  #					puts "\nNOME "+ nome.to_s
  #					puts "\nVALORE " + valore.to_s()

            case nome
            when '$Uso_abituale_auto'
              $Uso_abituale_auto = valore
            when '$N_km'
              $N_km = valore
            when '$Valore_auto'
              $Valore_auto = valore
            when '$Tipo_patente'
              $Tipo_patente = valore
            when '$Punti_patente_ConTe'
              $Punti_patente_ConTe = valore
            when '$Antifurto'
              $Antifurto = valore
            when '$Ricovero_notturno'
              $Ricovero_notturno = valore
            when '$Conducente_principale'
              $Conducente_principale = valore
            when '$Proprietario'
              $Proprietario = valore
            when '$Ditta'
              $Ditta = valore
            when '$Leasing'
              $Leasing = valore
            when '$No_utilizzo_altro_veicolo'
              $No_utilizzo_altro_veicolo = valore
            when '$No_patente_sospesa_5_anni'
              $No_patente_sospesa_5_anni = valore
            when '$No_multa_ebbrezza_5_anni'
              $No_multa_ebbrezza_5_anni = valore
            when '$N_conducenti_aggiuntivi'
              $N_conducenti_aggiuntivi = valore
            when '$No_figli_inf_17'
              $No_figli_inf_17 = valore
            when '$No_sinistri_colpa_3_anni'
              $No_sinistri_colpa_3_anni = valore
            when '$No_sinistri_senza_colpa_3_anni'
              $No_sinistri_senza_colpa_3_anni = valore
            when '$Guidatori_maggiori_28_anni'
              $Guidatori_maggiori_28_anni = valore
            when '$Massimale_RCA'
              $Massimale_RCA = valore
            when '$No_tutela_legale'
              $No_tutela_legale = valore
            when '$No_assistenza_stradale'
              $No_assistenza_stradale = valore
            end
          end



          # COSTANTI
          #data_decorrenza: considerare un mese avanti rispetto alla data attuale

          $Data_decorrenza_giorno 		= start_date.day.to_s()

          $Data_imm_classe_14_mese 		= number_to_month(DateTime::now().month.to_s)

          $Data_decorrenza_mese 		= start_date.month
          if $Data_decorrenza_mese.to_s().length == 1
            $Data_decorrenza_mese 	= "0"+$Data_decorrenza_mese.to_s()
          else
            $Data_decorrenza_mese 	= $Data_decorrenza_mese.to_s()
          end
          $Data_decorrenza_anno 		= start_date.year.to_s()
          $Data_decorrenza 				= $Data_decorrenza_giorno+"/"+ $Data_decorrenza_mese+"/"+ $Data_decorrenza_anno
          $Data_acquisto_anno 			= $Data_immatricolazione_anno	#considerare coincidente con data immatricolazione

          $Polizza_nuova_auto_usata = false
          $Contratto_esistente 		= false

          if $Classe_BM == "14"
            $Polizza_nuova_auto_usata = true
          else
            $Contratto_esistente 		= true
          end

          $Polizza_nuova_auto_nuova = false


        when "dialogo"
          res = mysql.query("Select * From costanti_dialogo")

          while row = res.fetch_hash do
            consumer				= row['nome']			,
            nome					= row['nome']			,
            valore  				= row['valore']

  #					puts "\nNOME "+ nome.to_s
  #					puts "\nVALORE " + valore.to_s()

            case nome
            when '$Conducenti_Dialogo'
              $Conducenti_Dialogo = valore
            when '$Intestatario_Driver_Dialogo'
              $Intestatario_Driver_Dialogo = valore
            when '$Intestatario_Proprietario_Dialogo'
              $Intestatario_Proprietario_Dialogo = valore
            when '$Cointestazione_Dialogo'
              $Cointestazione_Dialogo = valore
            when '$ConoscenzaCompagnia'
              $ConoscenzaCompagnia = valore
            when '$N_km'
              $N_km = valore
            when '$Valore_auto'
              $Valore_auto = valore
            when '$Nazionalita'
              $Nazionalita = valore
            when '$Situazione_assicurativa_BM'
              $Situazione_assicurativa_BM = valore
            when '$Proprietario_is_conducente'
              $Proprietario_is_conducente = valore
            when '$Ricovero_notturno'
              $Ricovero_notturno = valore
            when '$Massimale_RCA'
              $Massimale_RCA = valore
              end
          end

          $Data_decorrenza_giorno 		= start_date.day.to_s()
          $Data_decorrenza_mese 			= start_date.month
          $Data_decorrenza_mese 			= $Data_decorrenza_mese.to_s()
          $Data_imm_classe_14_mese 		= DateTime::now().month.to_s()
          $Data_decorrenza_anno 			= start_date.year.to_s()
          $Data_decorrenza 				= $Data_decorrenza_giorno+"/"+ $Data_decorrenza_mese+"/"+ $Data_decorrenza_anno

          # Conversioni
          $Cap_new = $Cap.to_i-1
          $Cap_new = $Cap_new.to_s()
          if $Cap_new.length < 5
            $Cap_new = $Cap_new.rjust(5, '0')
#            puts "CAP new " + $Cap_new
          end

          $Polizza_nuova_auto_usata = false
          $Contratto_esistente 		= false

          if $Classe_BM == "14"
            $Polizza_nuova_auto_usata = true
          else
            $Contratto_esistente 		= true
          end

          $Polizza_nuova_auto_nuova = false


        when "directLine"

          res = mysql.query("Select * From costanti_directLine")

          while row = res.fetch_hash do
            consumer				= row['nome']			,
            nome					= row['nome']			,
            valore  				= row['valore']

            case nome
            when '$Situazione_assicurativa'
              $Situazione_assicurativa = valore
            when '$Situazione_assicurativa_bersani'
              $Situazione_assicurativa_bersani = valore
            when '$Conoscenza_compagnia'
              $Conoscenza_compagnia = valore
            when '$Intestatario_conducente'
              $Intestatario_conducente = valore
            when '$Intestatario_proprietario'
              $Intestatario_proprietario = valore
            when '$N_conducenti_inf_26'
              $N_conducenti_inf_26 = valore
            when '$Altri_conducenti_assicurati'
              $Altri_conducenti_assicurati = valore
            when '$Flag_assicurato_5_anni'
              $Flag_assicurato_5_anni = valore
            when '$Flag_non_assicurato_5_anni'
              $Flag_non_assicurato_5_anni = valore
            when '$N_km'
              $N_km = valore
            when '$Uso_auto'
              $Uso_auto = valore
            when '$Antifurto'
              $Antifurto = valore
            when '$Ricovero_notturno'
              $Ricovero_notturno = valore
            when '$No_bonus_protetto'
              $No_bonus_protetto = valore
            when '$No_incendio_furto'
              $No_incendio_furto = valore
            when '$No_infortuni_conducente'
              $No_infortuni_conducente = valore
            when '$No_assistenza'
              $No_assistenza = valore
            when '$No_tutela_legale'
              $No_tutela_legale = valore
            when '$Massimale_RCA'
              $Massimale_RCA = valore
            end
          end

          $Data_decorrenza_giorno 		= start_date.day.to_s()
          $Data_decorrenza_mese 			= start_date.month
          $Data_imm_classe_14_mese 		= DateTime::now().month.to_s()
          $Data_decorrenza_mese 			= $Data_decorrenza_mese.to_s()
          $Data_decorrenza_anno 			= start_date.year.to_s()
          $Data_decorrenza 				= $Data_decorrenza_giorno+"/"+ $Data_decorrenza_mese+"/"+ $Data_decorrenza_anno
          $Data_acquisto_auto_anno 		= $Data_immatricolazione_anno

          if $Classe_BM_assegnazione == "Classe 14"
            $Polizza_nuova_auto_nuova = false
            $Contratto_esistente 		= false
            $Polizza_nuova_auto_usata = true
          else
            $Polizza_nuova_auto_nuova = false
            $Contratto_esistente 		= true
            $Polizza_nuova_auto_usata = false
          end

        when "genertel"
          res = mysql.query("Select * From costanti_genertel")

          while row = res.fetch_hash do
            consumer				= row['nome']			,
            nome					= row['nome']			,
            valore  				= row['valore']

            case nome

            when '$Conoscenza_Genertel'
              $Conoscenza_Genertel = valore
            when '$Optional_Abs'
              $Optional_Abs = valore
            when '$Optional_Airbag'
              $Optional_Airbag = valore
            when '$Ricovero_notturno'
              $Ricovero_notturno = valore
            when '$Tipologia_antifurto'
              $Tipologia_antifurto = valore
            when '$N_km'
              $N_km = valore
            when '$Esperienza_guidatori'
              $Esperienza_guidatori = valore
            when '$Assistenza_legale'
              $Assistenza_legale = valore
            when '$Valore_commerciale'
              $Valore_commerciale = valore
            when '$Nazionalita'
              $Nazionalita = valore
            when '$proprietario_is_contraente'
              $proprietario_is_contraente = valore
            when '$N_conducenti'
              $N_conducenti = valore
            when '$Assistenza_stradale'
              $Assistenza_stradale = valore
            when '$Massimale_RCA'
              $Massimale_RCA = valore
            when '$Flag_incidenti_2_anni'
              $Flag_incidenti_2_anni = valore
            when '$Flag_figli_conviventi'
              $Flag_figli_conviventi = valore
            end
          end

          $Data_decorrenza_giorno 		= start_date.day.to_s()
          $Data_decorrenza_mese 			= start_date.month
          $Data_decorrenza_mese 			= $Data_decorrenza_mese.to_s()
          $Data_imm_classe_14_mese 		= DateTime::now().month.to_s()
          $Data_decorrenza_anno 			= start_date.year.to_s()
          $Data_decorrenza 				= $Data_decorrenza_giorno+"/"+ $Data_decorrenza_mese+"/"+ $Data_decorrenza_anno


          if $Classe_BM == "14"
            $Polizza_nuova_auto_nuova 	= false
            $Contratto_esistente 		= false
            $Polizza_nuova_auto_usata 	= true
          else
            $Polizza_nuova_auto_nuova 	= false
            $Contratto_esistente 		= true
            $Polizza_nuova_auto_usata 	= false
          end

        when "genialloyd"

          res = mysql.query("Select * From costanti_genialloyd")

          while row = res.fetch_hash do
            consumer				= row['nome']			,
            nome					= row['nome']			,
            valore  				= row['valore']

            case nome

            when '$Flag_Guidatore_Giovane'
              $Flag_Guidatore_Giovane = valore
            when '$Flag_Guidatore_Inesperto'
              $Flag_Guidatore_Inesperto = valore
            when '$N_km'
              $N_km = valore
            when '$Conoscenza'
              $Conoscenza = valore
            when '$Massimale_RCA'
              $Massimale_RCA = valore
            when '$Massimale_RCA_f'
              $Massimale_RCA_f = valore
            when '$Antifurto'
              $Antifurto = valore
            when '$Guidatori_esperti'
              $Guidatori_esperti = valore
            when '$Ricovero_auto'
              $Ricovero_auto = valore
            when '$Uso_auto'
              $Uso_auto = valore
            when '$Situazione_assicurativa'
              $Situazione_assicurativa = valore
            when '$Provenienza'
              $Provenienza = valore
            when '$No_altra_polizza'
              $No_altra_polizza = valore
            when '$No_famigliari'
              $No_famigliari = valore
            when '$Guidatori_esperti'
              $Guidatori_esperti = valore
            when '$Flag_no_Guidatore_Giovane'
              $Flag_no_Guidatore_Giovane = valore
            when '$Flag_no_Guidatore_inesperto'
              $Flag_no_Guidatore_inesperto = valore
            when '$Guidatore_is_persona'
              $Guidatore_is_persona = valore
            when '$Contraente_is_intestatario'
              $Contraente_is_intestatario = valore
            when '$Data_acquisto_is_immatricolazione'
              $Data_acquisto_is_immatricolazione = valore
            when '$Conoscenza'
              $Conoscenza = valore
            when '$Usufruito_Bersani_no'
              $Usufruito_Bersani_no = valore
            end
          end

          $Data_decorrenza_giorno 		= start_date.day.to_s()
          $Data_decorrenza_mese 			= start_date.month
          $Data_decorrenza_mese 			= $Data_decorrenza_mese.to_s()
          $Data_imm_classe_14_mese 		= DateTime::now().month.to_s()
          $Data_decorrenza_anno 			= start_date.year.to_s()
  #				$Data_decorrenza_mese 			= number_to_month($Data_decorrenza_mese)
          $Data_decorrenza_mese 			= pad_number($Data_decorrenza_mese)
          $Data_imm_classe_14_mese 		= number_to_month($Data_imm_classe_14_mese)


          if $Classe_BM == "14"
            $Polizza_nuova_auto_nuova = false
            $Contratto_esistente 		= false
            $Polizza_nuova_auto_usata = true
          else
            $Polizza_nuova_auto_nuova = false
            $Contratto_esistente 		= true
            $Polizza_nuova_auto_usata = false
          end

        when "linear"
          res = mysql.query("Select * From costanti_linear")

          while row = res.fetch_hash do
            consumer				= row['nome']			,
            nome					= row['nome']			,
            valore  				= row['valore']

#            puts " NOME: " + nome.to_s
#            puts " VALORE: " + valore.to_s
            case nome

            when '$Situazione_assicurativa_BM'
              $Situazione_assicurativa_BM = valore
            when '$Frazionamento_polizza'
              $Frazionamento_polizza = valore
            when '$Ricovero_auto'
              $Ricovero_auto = valore
            when '$N_km'
              $N_km = valore
            when '$N_eta_inferiore_26'
              $N_eta_inferiore_26 = valore
            when '$Massimale_RCA'
              $Massimale_RCA = valore
            when '$Antifurto'
              $Antifurto = valore
            when '$Utilizzo_auto'
              $Utilizzo_auto = valore
            when '$Conducente_is_proprietario'
              $Conducente_is_proprietario = valore
            when '$Sesso'
              $Sesso = valore
            end
          end

          $Data_decorrenza_giorno 		= start_date.day.to_s()
          $Data_decorrenza_mese 			= start_date.month
          $Data_decorrenza_mese 			= $Data_decorrenza_mese.to_s()
          $Data_imm_classe_14_mese 		= DateTime::now().month.to_s()
          $Data_decorrenza_anno 			= start_date.year.to_s()
          $Data_decorrenza_mese 			= number_to_month($Data_decorrenza_mese)
          $Data_imm_classe_14_mese 		= number_to_month($Data_imm_classe_14_mese)

          if $Classe_BM == "14"
            $Polizza_nuova_auto_nuova = false
            $Contratto_esistente 		= false
            $Polizza_nuova_auto_usata = true
          else
            $Polizza_nuova_auto_nuova = false
            $Contratto_esistente 		= true
            $Polizza_nuova_auto_usata = false
          end

        when "quixa"

          res = mysql.query("Select * From costanti_quixa")

          while row = res.fetch_hash do
            consumer				= row['nome']			,
            nome					= row['nome']			,
            valore  				= row['valore']

            case nome

              when '$N_km_quixa'
                $N_km_quixa = valore
              when '$Uso_auto'
                $Uso_auto = valore
              when '$Situazione_assicurativa'
                $Situazione_assicurativa = valore
              when '$Flag_conducenti_inf_26'
                $Flag_conducenti_inf_26 = valore
              when '$Situaziona_assicurativa'
                $Situaziona_assicurativa = valore
              when '$Massimale_RCA'
                $Massimale_RCA = valore
              when '$Mezzo_pagamento'
                $Mezzo_pagamento = valore
              when '$Flag_no_leasing'
                $Flag_no_leasing = valore
              when '$Nazione'
                $Nazione = valore
              when '$Compagnia_precedente'
                $Compagnia_precedente = valore
              when '$Massimale_RCA'
                $Massimale_RCA = valore

            end
          end

          $Data_imm_classe_14_mese 			= DateTime::now().month.to_s()

          $Data_decorrenza_giorno = pad_number(start_date.day.to_s())

          $Data_decorrenza_mese 			= start_date.month
          $Data_decorrenza_mese 			= $Data_decorrenza_mese.to_s()

          $Data_decorrenza_mese = pad_number( $Data_decorrenza_mese )

          $Data_imm_classe_14_mese = number_to_month($Data_imm_classe_14_mese)

          $Data_decorrenza_anno 					= start_date.year.to_s()
          $Data_decorrenza 							= $Data_decorrenza_giorno+"/"+ $Data_decorrenza_mese+"/"+ $Data_decorrenza_anno

          $Polizza_nuova_auto_nuova = false
          $Contratto_esistente 	= false
          $Polizza_nuova_auto_usata = false
          if $Classe_BM == "14"
            $Polizza_nuova_auto_usata = true
          else
            $Contratto_esistente 		= true
          end

        when "zurich"
          res = mysql.query("Select * From costanti_zurich")

          while row = res.fetch_hash do
            consumer				= row['nome']			,
            nome					= row['nome']			,
            valore  				= row['valore']

            case nome
              when '$Conoscenza_Zurich'
                $Conoscenza_Zurich = valore
              when '$Situaziona_assicurativa'
                $Situaziona_assicurativa = valore
              when '$Nazionalita'
                $Nazionalita = valore
              when '$Antifurto'
                $Antifurto = valore
              when '$Antifurto2'
                $Antifurto2 = valore
              when '$No_stabilizzatore'
                $No_stabilizzatore = valore
              when '$Si_ABS'
                $Si_ABS = valore
              when '$Si_airbag'
                $Si_airbag = valore
              when '$No_gancio_traino'
                $No_gancio_traino = valore
              when '$Titolo_studio_Zurich'
                $Titolo_studio_Zurich = valore
              when '$Massimale_RCA'
                $Massimale_RCA = valore
              when '$No_incendio_furto'
                $No_incendio_furto = valore
              when '$No_infortuni_conducente'
                $No_infortuni_conducente = valore

            end
          end
          $Data_decorrenza_giorno 		= start_date.day.to_s()
          $Data_decorrenza_mese 			= start_date.month
          $Data_decorrenza_mese 			= $Data_decorrenza_mese.to_s()
          $Data_imm_classe_14_mese 		= DateTime::now().month.to_s()
          $Data_decorrenza_anno 			= start_date.year.to_s()
          $Data_decorrenza 				= $Data_decorrenza_giorno+"/"+ $Data_decorrenza_mese+"/"+ $Data_decorrenza_anno

          if $Classe_BM == "14"
            $Polizza_nuova_auto_nuova = false
            $Contratto_esistente 		= false
            $Polizza_nuova_auto_usata = true
          else
            $Polizza_nuova_auto_nuova = false
            $Contratto_esistente 		= true
            $Polizza_nuova_auto_usata = false
          end
      end
      mysql.close()
      @@logger.info('Table_reader_constants.table_reader => ' + $compagnia) {"   ...La lettura si e' completata correttamente"}
    rescue Exception => ex
      @@logger.fatal('Table_reader_constants.table_reader => ' + $compagnia) {ex.message}
      raise
    end
	end
	
	def number_to_month(month)
		$Data_imm_classe_14_mese = month.to_s
		case $Data_imm_classe_14_mese
			when "1"
				$Data_imm_classe_14_mese = "Gennaio"
			when "2"
				$Data_imm_classe_14_mese = "Febbraio"
			when "3"
				$Data_imm_classe_14_mese = "Marzo"
			when "4"
				$Data_imm_classe_14_mese = "Aprile"
			when "5"
				$Data_imm_classe_14_mese = "Maggio"
			when "6"
				$Data_imm_classe_14_mese = "Giugno"
			when "7"
				$Data_imm_classe_14_mese = "Luglio"
			when "8"
				$Data_imm_classe_14_mese = "Agosto"
			when "9"
				$Data_imm_classe_14_mese = "Settembre"
			when "10"
				$Data_imm_classe_14_mese = "Ottobre"
			when "11"
				$Data_imm_classe_14_mese = "Novembre"
			when "12"
				$Data_imm_classe_14_mese = "Dicembre"																																																									
		end	
		
		return $Data_imm_classe_14_mese		
	end
	
	def pad_number (num)
#    $Data_decorrenza_giorno = num
		case num.to_s()
			when "1"
				num = "01"
			when "2"
				num = "02"
			when "3"
				num = "03"
			when "4"
				num = "04"
			when "5"
				num = "05"
			when "6"
				num = "06"
			when "7"
				num = "07"
			when "8"
				num = "08"
			when "9"
				num = "09"
		end		
		return num
	end
end

