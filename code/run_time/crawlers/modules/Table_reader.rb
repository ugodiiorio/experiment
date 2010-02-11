#!/usr/bin/ruby -w
# simple.rb - simple MySQL script using Ruby MySQL module
require "rubygems"
require "mysql"

class Reader
	def initialize ()
    begin
      mysql = Mysql.init()
      mysql = Mysql.real_connect($db_ip, $db_conn_user, $db_conn_pwd, "Quixa_technical")
      res = mysql.query("Select * From profili_anagrafici")
      profilo_anagrafico = rand(res.num_rows()) +1
      $profilo_anagrafico = profilo_anagrafico
    rescue Exception => ex
      @@logger.fatal('Reader.initialize => ' + $compagnia) {ex.message}
      raise ex
    end
		 
	end
	
	def table_reader()
    begin
      mysql = Mysql.init()
      mysql = Mysql.real_connect($db_ip, $db_conn_user, $db_conn_pwd, "Quixa_technical")

      @@logger.debug('Reader.table_reader => ' + $compagnia) {"E' stata richiesta la lettura delle variabili per la compagnia "+ $compagnia}
      @@logger.debug('Reader.table_reader => ' + $compagnia) {"Profilo assicurativo: "+ $profilo_assicurativo.to_s()}
      @@logger.debug('Reader.table_reader => ' + $compagnia) {"Profilo anagrafico: "+ $profilo_anagrafico.to_s()}

      res = mysql.query("Select * From profili_anagrafici WHERE id_profilo_anagrafico = '"+ $profilo_anagrafico.to_s() +"'")

      while row = res.fetch_hash do
        $id_profilo_anagrafico		= row['id_profilo_anagrafico'],
        $Nome					  	= row['Nome'],
        $Cognome 					= row['Cognome'],
        $Luogo_nascita 				= row['Luogo_nascita'],
        $Indirizzo_via				= row['Indirizzo_via'],
        $Indirizzo_num				= row['Indirizzo_num'],
        $Phone_type 			= row['phone_type'],
        $Mobile_prefisso 			= row['Mobile_prefisso'],
        $Mobile_suffisso 			= row['Mobile_suffisso'],
        $e_mail 					= row['e_mail'],
        $Toponimo				= row['Toponimo'],
        $Titolo_studio_Zurich		= row['Titolo_studio_Zurich']
      end


      case $compagnia
        when "conTe"
          res = mysql.query("Select * From profilo_ConTe_" + $source + " WHERE id_profilo_ConTe ='"+ $profilo_assicurativo.to_s() +"'")

          while row = res.fetch_hash do
            $id_profilo_ConTe					= row['id_profilo_ConTe']			,
            $Provincia_residenza  				= row['Provincia_residenza']		,
            $Comune_residenza					= row['Comune_residenza']			,
            $Codice_comune						= row['Codice_comune']			,
            $Classe_BM							= row['Classe_BM']					,
            $Data_nascita 						= row['Data_nascita']				,
            $Data_nascita_giorno				= row['Data_nascita_giorno']		,
            $Data_nascita_mese					= row['Data_nascita_mese']			,
            $Data_nascita_anno					= row['Data_nascita_anno']			,
            $Sesso								= row['Sesso']						,
            $Cap								= row['Cap']						,
            $Data_immatricolazione				= row['Data_immatricolazione']		,
            $Data_immatricolazione_giorno		= row['Data_immatricolazione_giorno'],
            $Data_immatricolazione_mese			= row['Data_immatricolazione_mese']	,
            $Data_immatricolazione_anno			= row['Data_immatricolazione_anno']	,
            $Anni_patente						= row['Anni_patente']				,
            $Alimentazione  					= row['Alimentazione']				,
            $Marca_auto  						= row['Marca_auto']					,
            $Codice_marca						= row['Codice_marca']					,
            $Modello_auto  						= row['Modello_auto']					,
            $Codice_modello						= row['Codice_modello']					,
            $Allestimento_auto					= row['Allestimento_auto']		,
            $Codice_allestimento				= row['Codice_allestimento']					,
            $Professione  						= row['Professione']				,
            $Stato_civile  						= row['Stato_civile']
          end
          if $Comune_residenza.include? "~"
            $Comune_residenza = $Comune_residenza.gsub!("~", "'")
            @@logger.debug('Reader.table_reader => ' + $compagnia) {"Comune residenza: " + $Comune_residenza}
          end
        when "dialogo"
          res = mysql.query("Select * From profilo_Dialogo_" + $source + " WHERE id_profilo_Dialogo ='"+ $profilo_assicurativo.to_s() +"'")

          while row = res.fetch_hash do
            $id_profilo_Dialogo  			= row['id_profilo_dialogo']			,
            $Marca_auto  					= row['Marca_auto']  				,
            $Modello_auto  					= row['Modello_auto']  				,
            $Allestimento_auto  			= row['Allestimento_auto']  		,
            $Classe_BM  					= row['Classe_BM']  				,
            $Data_nascita					= row['Data_nascita']				,
            $Data_nascita_giorno 			= row['Data_nascita_giorno']		,
            $Data_nascita_mese 				= row['Data_nascita_mese']			,
            $Data_nascita_anno 				= row['Data_nascita_anno']			,
            $Sesso							= row['Sesso']						,
            $N_anni_patente					= row['N_anni_patente']				,
            $Professione  					= row['Professione'] 				,
            $N_sinistri_4_anni  			= row['N_sinistri_4_anni'] 			,
            $Cap							= row['Cap']						,
            $Data_immatricolazione			= row['Data_immatricolazione']		,
            $Data_immatricolazione_giorno 	= row['Data_immatricolazione_giorno'],
            $Data_immatricolazione_mese		= row['Data_immatricolazione_mese']	,
            $Data_immatricolazione_anno		= row['Data_immatricolazione_anno']
          end
        when "directLine"
          res = mysql.query("Select * From profilo_DirectLine_" + $source + " WHERE id_profilo_DirectLine ='"+ $profilo_assicurativo.to_s() +"'")

          while row = res.fetch_hash do
            $id_profilo_DirectLine 		= row['id_profilo_DirectLine'],
            $Professione  				= row['Professione'],
            $N_anni_patente  			= row['N_anni_patente'],
            $Data_nascita				= row['Data_nascita'],
            $Data_nascita_giorno			= row['Data_nascita_giorno'],
            $Data_nascita_mese			= row['Data_nascita_mese'],
            $Data_nascita_anno			= row['Data_nascita_anno'],
            $Sesso						= row['Sesso'],
            $Stato_civile 				= row['Stato_civile'],
            $Cap							= row['Cap'],
            $Classe_BM_provenienza  		= row['Classe_BM_provenienza'],
            $Classe_BM_assegnazione  	= row['Classe_BM_assegnazione'],
            $Flag_sinistri_5_anni  		= row['Flag_sinistri_5_anni'],
            $Marca_auto  				= row['Marca_auto'],
            $Modello_auto  				= row['Modello_auto'],
            $Allestimento_auto  			= row['Allestimento_auto'],
            $Data_immatricolazione		= row['Data_immatricolazione'],
            $Data_immatricolazione_anno   = row['Data_immatricolazione_anno'],
            $Data_immatricolazione_mese   = row['Data_immatricolazione_mese'],
            $Data_immatricolazione_giorno = row['Data_immatricolazione_giorno']
          end
        when "genertel"
          res = mysql.query("Select * From profilo_Genertel_" + $source + " WHERE id_profilo_Genertel ='"+ $profilo_assicurativo.to_s() +"'")

          while row = res.fetch_hash do
            $id_profilo_genertel			= row['id_profilo_genertel'],
            $Comune_residenza				= row['Comune_residenza'],
            $Provincia_residenza  			= row['Provincia_residenza'],
            $Data_nascita					= row['Data_nascita'],
            $Data_nascita_giorno			= row['Data_nascita_giorno'],
            $Data_nascita_mese				= row['Data_nascita_mese'],
            $Data_nascita_anno				= row['Data_nascita_anno'],
            $Classe_BM						= row['Classe_BM'],
            $N_sinistri_2_anni  			= row['N_sinistri_2_anni'],
            $Professione  	= row['Professione'],
            $Sesso							= row['Sesso'],
            $Cap							= row['Cap'],
            $Marca_auto  					= row['Marca_auto'],
            $Modello_auto  					= row['Modello_auto'],
            $Allestimento_auto  	= row['Allestimento_auto'],
            $Alimentazione  				= row['Alimentazione'],
            $Cilindrata  					= row['Cilindrata'],
            $Ultimi_2_anni_classe_1			= row['Ultimi_2_anni_classe_1'],
            $Data_immatricolazione			= row['Data_immatricolazione'],
            $Data_immatricolazione_giorno 	= row['Data_immatricolazione_giorno'],
            $Data_immatricolazione_mese		= row['Data_immatricolazione_mese'],
            $Data_immatricolazione_anno		= row['Data_immatricolazione_anno']
          end
          if $Comune_residenza.include? "~"
            $Comune_residenza = $Comune_residenza.gsub!("~", "'")
            @@logger.debug('Reader.table_reader => ' + $compagnia) {"Comune residenza: " + $Comune_residenza}
          end
        when "genialloyd"
          res = mysql.query("Select * From profilo_Genialloyd_" + $source + "  WHERE id_profilo_Genialloyd ='"+ $profilo_assicurativo.to_s() +"'")

          while row = res.fetch_hash do
            $id_profilo_genialloyd	= row['id_profilo_genialloyd'],
            $Cap	= row['Cap'],
            $Data_nascita	= row['Data_nascita'],
            $Data_nascita_giorno	= row['Data_nascita_giorno'],
            $Data_nascita_mese	= row['Data_nascita_mese'],
            $Data_nascita_anno	= row['Data_nascita_anno'],
            $Comune_residenza  	= row['Comune_residenza'],
            $Sesso	= row['Sesso'],
            $Classe_BM	= row['Classe_BM'],
            $Professione  	= row['Professione'],
            $Marca_auto  	= row['Marca_auto'],
            $Modello_auto  	= row['Modello_auto'],
            $Allestimento_auto  	= row['Allestimento_auto'],
            $N_sinistri 	= row['N_sinistri'],
            $N_sinistri_ultimi_2_anni  	= row['N_sinistri_ultimi_2_anni'],
            $Data_immatricolazione	= row['Data_immatricolazione'],
            $Data_immatricolazione_giorno	= row['Data_immatricolazione_giorno'],
            $Data_immatricolazione_mese	= row['Data_immatricolazione_mese'],
            $Data_immatricolazione_anno	= row['Data_immatricolazione_anno']
          end

          $Modello_auto = $Modello_auto.gsub("~","'")
          if $Comune_residenza.include? "~"
            $Comune_residenza = $Comune_residenza.gsub!("~", "'")
            @@logger.debug('Reader.table_reader => ' + $compagnia) {"Comune residenza: " + $Comune_residenza}
          end
        when "linear"
          res = mysql.query("Select * From profilo_Linear_" + $source + " WHERE id_profilo_Linear ='"+ $profilo_assicurativo.to_s() +"'")

          while row = res.fetch_hash do
            $id_profilo_Linear 	= row['id_profilo_Linear'],
            $Comune_residenza 	= row['Comune_residenza'],
            $Data_nascita	= row['Data_nascita'],
            $Data_nascita_giorno	= row['Data_nascita_giorno'],
            $Data_nascita_mese	= row['Data_nascita_mese'],
            $Data_nascita_anno	= row['Data_nascita_anno'],
            $Data_patente	= row['Data_patente'],
            $Data_patente_mese	= row['Data_patente_mese'],
            $Data_patente_anno	= row['Data_patente_anno'],
            $Data_immatricolazione	= row['Data_immatricolazione'],
            $Data_immatricolazione_mese	= row['Data_immatricolazione_mese'],
            $Data_immatricolazione_anno	= row['Data_immatricolazione_anno'],
            $Sesso	= row['Sesso'],
            $N_sinistri_5_anni	= row['N_sinistri_5_anni'],
            $N_sinistri_1_anno	= row['N_sinistri_1_anno'],
            $Classe_BM  	= row['Classe_BM'],
            $Marca_auto  	= row['Marca_auto'],
            $Modello_auto  	= row['Modello_auto'],
            $Allestimento_auto  	= row['Allestimento_auto']
          end
          if $Comune_residenza.include? "~"
            $Comune_residenza = $Comune_residenza.gsub!("~", "'")
            @@logger.debug('Reader.table_reader => ' + $compagnia) {"Comune residenza: " + $Comune_residenza}
          end
        when "quixa"
          res = mysql.query("Select * From profilo_Quixa_" + $source + " WHERE id_profilo_Quixa ='"+ $profilo_assicurativo.to_s() +"'")

          while row = res.fetch_hash do
            $id_profilo_quixa	= row['id_profilo_quixa'],
            $Comune_residenza	= row['Comune'],
            $Marca_auto  	= row['Marca_auto'],
            $Modello_auto  	= row['Modello_auto'],
            $Allestimento_auto  	= row['Allestimento_auto'],
            $Provincia  	= row['Provincia'],
            $Professione  	= row['Professione'],
            $Classe_BM  	= row['Classe_BM'],
            $Sesso	= row['Sesso'],
            $Data_nascita_giorno	= row['Data_nascita_giorno'],
            $Data_nascita_mese	= row['Data_nascita_mese'],
            $Data_nascita_anno	= row['Data_nascita_anno'],
            $Data_nascita	= row['Data_nascita'],
            $Data_immatricolazione_mese	= row['Data_immatricolazione_mese'],
            $Data_immatricolazione_anno	= row['Data_immatricolazione_anno'],
            $Data_immatricolazione	= row['Data_immatricolazione'],
            $N_incidenti_anno_1  	= row['N_incidenti_anno_1'],
            $N_incidenti_anno_2  	= row['N_incidenti_anno_2'],
            $N_incidenti_anno_3  	= row['N_incidenti_anno_3'],
            $N_incidenti_anno_4  	= row['N_incidenti_anno_4'],
            $N_incidenti_anno_5  	= row['N_incidenti_anno_5'],
            $N_incidenti_anno_0  	= row['N_incidenti_anno_0']
          end
          if $Comune_residenza.include? "~"
            $Comune_residenza = $Comune_residenza.gsub!("~", "'")
            @@logger.debug('Reader.table_reader => ' + $compagnia) {"Comune residenza: " + $Comune_residenza}
          end
        when "zurich"
          res = mysql.query("Select * From profilo_Zurich_" + $source + " WHERE id_profilo_Zurich ='"+ $profilo_assicurativo.to_s() +"'")

          while row = res.fetch_hash do
            $id_profilo_zurich	= row['id_profilo_zurich'],
            $Stato_civile 	= row['Stato_civile'],
            $Professione  	= row['Professione'],
            $Comune_residenza = row['Comune_residenza'],
            $Alimentazione  	= row['Alimentazione'],
            $Marca_auto  	= row['Marca_auto'],
            $Modello_auto  	= row['Modello_auto'],
            $Allestimento_auto  	= row['Allestimento_auto'],
            $Classe_BM  	= row['Classe_BM'],
            $N_sinistri_5_anni  	= row['N_sinistri_5_anni'],
            $Data_nascita_giorno	= row['Data_nascita_giorno'],
            $Data_nascita_mese	= row['Data_nascita_mese'],
            $Data_nascita_anno	= row['Data_nascita_anno'],
            $Data_nascita	= row['Data_nascita'],
            $Sesso	= row['Sesso'],
            $Cap	= row['Cap'],
            $Data_immatricolazione_mese	= row['Data_immatricolazione_mese'],
            $Data_immatricolazione_anno	= row['Data_immatricolazione_anno']
          end
          if $Comune_residenza.include? "~"
            $Comune_residenza = $Comune_residenza.gsub!("~", "'")
            @@logger.debug('Reader.table_reader => ' + $compagnia) {"Comune residenza: " + $Comune_residenza}
          end
      end
      res.free
      @@logger.debug('Reader.table_reader => ' + $compagnia) {"La lettura si e' completata correttamente"}
    rescue Exception => ex
      @@logger.fatal('Reader.table_reader => ' + $compagnia) {ex.message}
      raise ex
    end
	end

end

