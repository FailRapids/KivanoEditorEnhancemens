extends Node
################################### R E A D M E ##################################
#
#
#

##################################################################################
#########                     Imported classes/scenes                    #########
##################################################################################

##################################################################################
#########                       Signals definitions                      #########
##################################################################################

##################################################################################
#####  Variables (Constants, Export Variables, Node Vars, Normal variables)  #####
######################### var myvar setget myvar_set,myvar_get ###################
const PATH_2_GROUPS_DATA_FILE = "res://addons/games.kivano.raw_groups.dat";

var Group = {};

##################################################################################
#########                          Init code                             #########
##################################################################################
func _notification(what):
	if (what == NOTIFICATION_INSTANCED):
		pass #all internal initialization
	elif(what == NOTIFICATION_READY):
		var groupsData = loadDictFromFile(PATH_2_GROUPS_DATA_FILE);
		var groups = groupsData.values()[0];
		for groupName in groups:
			Group[groupName] = groupName;
			print("adding: ", groupName )

##################################################################################
#########                       Getters and Setters                      #########
##################################################################################

##################################################################################
#########              Should be implemented in inheritanced             #########
##################################################################################

##################################################################################
#########                    Implemented from ancestor                   #########
##################################################################################

##################################################################################
#########                       Connected Signals                        #########
##################################################################################

##################################################################################
#########     Methods fired because of events (usually via Groups interface)  ####
##################################################################################

##################################################################################
#########                         Public Methods                         #########
##################################################################################

##################################################################################
#########                         Inner Methods                          #########
##################################################################################
func loadDictFromFile(inFilePath):
	var fileWithData = File.new();
	var loadedDictData = {}
	if !fileWithData.file_exists(inFilePath):
		return {};

	fileWithData.open(inFilePath, File.READ);
	while (!fileWithData.eof_reached()):
		var line = fileWithData.get_line();
		loadedDictData = parse_json(line);
		if typeof(loadedDictData) == TYPE_DICTIONARY: #exit when found first dict
			break;
	fileWithData.close();

	return loadedDictData;
##################################################################################
#########                         Inner Classes                          #########
##################################################################################