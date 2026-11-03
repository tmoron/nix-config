echo "params : $@" 1>&2
echo -e "\0prompt\x1fprompt >"
echo -e "\0use-hot-keys\x1ftrue"

if [[ -z $@ ]]; then
	exit
fi

initial_prompt="contexte additionel: je suis tom, toutes les demandes seront pour moi donc si je demande une action ça sera pour des entitées a mon nom et dans ma chambre ex: allume la lumière devrais allumer Lumières Tom. tu a le droit de répondre avec 10 mots maximum les mots suivants seront coupés. fin du contexte additionel."
prompt="$initial_prompt $*"

token=$(cat "$HA_TOKEN_FILE")


{
	response="$(curl -X POST -H "Authorization: Bearer $token" -H "Content-Type: application/json" \
		-d "{\"text\":\"$prompt\",\"agent_id\":\"conversation.ollama_conv_with_think\"}" \
		https://ha.tmoron.fr/api/conversation/process \
		| jq -r ".response.speech.plain.speech")"
	

	notify-send "homeassistant" "$response"

} >/dev/null 2>&1 &
