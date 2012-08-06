<%@page contentType="text/html"%>
<%@page pageEncoding="ISO-8859-1"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.HashMap"%>
<%@page import="org.murillo.mcuWeb.ConferenceMngr"%>
<%
    //Get conference manager
    ConferenceMngr confMngr = (ConferenceMngr) getServletContext().getAttribute("confMngr");
%>
<fieldset>
    <legend><img src="icons/image.png"> Conference</legend>
    <form method="POST" action="controller/addConferenceAdHocTemplate">
        <table class="form">
            <tr>
                <td>Name:</td>
                <td><input type="text" name="name"></td>
            </tr>
            <tr>
                <td>DID pattern:</td>
                <td><input type="text" name="did"></td>
            </tr>
            <tr>
                <td>MediaMixer:</td>
                <td><select name="mixerId">
                    <%
                        //Get mixers
                        Iterator<org.murillo.mcuWeb.MediaMixer> it = confMngr.getMediaMixers().values().iterator();
                        //Loop
                        while(it.hasNext()) {
                            // Get mixer
                            org.murillo.mcuWeb.MediaMixer mixer = it.next();
                            %><option value="<%=mixer.getUID()%>"><%=mixer.getName()%><%
                        }
                    %>
                </select></td>
            </tr>
            <tr>
                <td>Composition:</td>
                <td><select name="compType">
                     <%
                        //Get mosaics
                        java.util.HashMap<Integer,String> mosaics = org.murillo.mcuWeb.MediaMixer.getMosaics();
                        //Get iterator
                        Iterator<java.lang.Integer> itMosaics = mosaics.keySet().iterator();
                        //Loop
                        while(itMosaics.hasNext()) {
                            //Get key and value
                            Integer k = itMosaics.next();
                            String v = mosaics.get(k);
                            %><option value="<%=k%>"><%=v%><%
                        }
                    %></select>
                </td>
            </tr>
            <tr>
                <td>Mosaic size:</td>
                <td><select name="size">
                    <%
                        //Get sizes
                        java.util.HashMap<Integer,String> sizes = org.murillo.mcuWeb.MediaMixer.getSizes();
                        //Get iterator
                        Iterator<java.lang.Integer> itSizes = sizes.keySet().iterator();
                        //Loop
                        while(itSizes.hasNext()) {
                            //Get key and value
                            Integer k = itSizes.next();
                            String v = sizes.get(k);
                            %><option value="<%=k%>"><%=v%><%
                        }
                    %>
                    </select>
                </td>
            </tr>
             <tr>
                <td>Default profile:</td>
                <td><select name="profileId">
                     <%
                        //Get profiles
                        Iterator<org.murillo.mcuWeb.Profile> itProf = confMngr.getProfiles().values().iterator();
                        //Loop
                        while(itProf.hasNext()) {
                            // Get mixer
                            org.murillo.mcuWeb.Profile profile = itProf.next();
                            %><option value="<%=profile.getUID()%>"><%=profile.getName()%><%
                        }
                    %></select>
                </td>
            </tr>
	    <tr>
                <td>Override Audio Codecs:</td>
                <td><input type="text" name="audioCodecs"></td>
            </tr>
	    <tr>
                <td>Override Video Codecs:</td>
                <td><input type="text" name="videoCodecs"></td>
            </tr>
	    <tr>
                <td>Override Text Codecs:</td>
                <td><input type="text" name="textCodecs"></td>
            </tr>
        </table>
        <input class="accept" type="submit" value="Create">
        <input class="cancel" type="submit" onClick="document.location.href='index.jsp';return false;" value="Cancel">
    </form>
</fieldset>