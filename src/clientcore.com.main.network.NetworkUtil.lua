function requestHttpUpload(slot0, slot1, slot2, slot3, slot4, slot5, slot6)
	slot7 = requestHttp(slot0, slot2, slot3, slot4, slot5, "POST", slot6, nil, true)

	slot16(slot14 .. "\r\n")
	slot16(string.format("Content-Disposition: form-data; name=\"%s\"; filename=\"%s\"\r\n", slot8, slot10))
	slot16(string.format("Content-Type: %s\r\n\r\n", slot12))
	slot16(slot11 .. "\r\n")
	slot16(slot14 .. "--")
	slot7:setRequestHeader("Content-Type", slot17)
	slot7:setRequestHeader("Content-Length", tostring(#""))
	slot7:send("")

	return slot7
end

return
