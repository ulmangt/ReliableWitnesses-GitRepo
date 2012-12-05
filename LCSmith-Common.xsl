<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
   xmlns:tei="http://www.tei-c.org/ns/1.0" version="2.0">
   <xd:doc xmlns:xd="http://www.oxygenxml.com/ns/doc/xsl" scope="stylesheet">
      <xd:desc>
         <xd:p><xd:b>Created on:</xd:b> Jul 24, 2012</xd:p>
         <xd:p><xd:b>Author:</xd:b>H. Lewis Ulman</xd:p>
         <xd:p/>
      </xd:desc>
   </xd:doc>

   <!-- This style sheet is divided into the following sections:
      
      HTML WRAPPER
      MAJOR DOCUMENT STRUCTURES
      PAGE, COLUMN, AND LINE BREAKS
      
      
      MAJOR TEXTUAL STRUCTURES
      SORTING AND FORMATTING LISTS
      ANNOTATIONS
      MANUSCRIPT FEATURES
      MISCELLANEOUS TEXTUAL FEATURES
      IMAGES      
   -->
   <xsl:template match="/">
   <!-- HTML WRAPPER: Note that this template 
      places the entire contents enclosed within the text tags of your document into 
      the HTML of the Web page. 
   -->
      <html>
         <head>
            <!-- Creat the head of the HTML document -->
            <!-- First, populate meta element with keywords -->
            <xsl:element name="meta">
               <xsl:attribute name="name">keywords</xsl:attribute>
               <xsl:attribute name="content">
                  <xsl:for-each select="//tei:keywords[@scheme='#LCSH']/tei:term">
                     <xsl:choose>
                        <xsl:when test="current()=//tei:keywords[@scheme='#LCSH']/tei:term[1]">
                           <xsl:apply-templates/>
                        </xsl:when>
                        <xsl:otherwise>, <xsl:apply-templates/></xsl:otherwise>
                     </xsl:choose>
                  </xsl:for-each>
               </xsl:attribute>
            </xsl:element>
            <!-- Grab title from the fileDesc element of the TEI header. -->
            <title>
               <xsl:value-of
                  select="/tei:teiCorpus/tei:teiHeader/tei:fileDesc/tei:titleStmt/tei:title"/>
            </title>
            <script src="jquery-1.8.3.min.js"></script>
            <script>
               $(document).ready(function(){
               $("button").click(function(){
               $(".sic").toggleClass("sictoggle");
               $(".corr").toggleClass("corrtoggle");
               });
               });
            </script>
            <style type="text/css">
              <xsl:value-of select="$bodyRule"/>
               .masthead {
                   vertical-align : top;
               }
               .mastheadl {
                   float : left;
                   width : 175px;
                   text-align : left;
                   left : 50px;
               }
               .mastheadc {
                   display : inline;
               }
               .mastheadr {
                   float : right;
                   text-align : right;
                   width : 225px;
                   position : absolute;
                   top : 15px;
                   left : 700px;
               }
               a:link {
               text-decoration: none;
               }
               a:hover {
               font-weight: bold;
                   }
               a.annotation {
               text-decoration: none;
                   }
               div.pagebreak {
                   margin-top : 25px;
                   margin-bottom : 0px;
                   text-align : center;
               }
               div.envelope {
                   font-size : .85em;
                   width: 50%;
               }
               .msDesc {
                   font-size : .85em;
                   width: 50%;
               }
               .half-width {
                   width : 50%;
               }
               hr {
                   color : #888833;
                   clear : left;
               }
               div#letter {
                   border: 3px groove #666666;
                   padding: 5px;
               }
               h1 {
                   font-family : Verdana, Arial, Helvetica, sans-serif;
                   font-size : 16pt;
                   font-style : normal;
               }
               h2 {
               }
               h3 {
               }
               sup {
               }
               img {
                   float : left;
                   padding : 5px;
                   margin-top : 5px;
                   margin-bottom : 5px;
               }
               .nocancel {
                   text-decoration : none;
                   color : #000000;
               }
               .cancel {
                   text-decoration : line-through;
                   color : #FF0000;
               }
               div.fl_img_right {
                   float : right;
                   text-align : center;
                   margin : 5px 5px 5px 5px;
               }
               .ProjectTitle {
                   font-family : Verdana, Arial, Helvetica, sans-serif;
                   font-size : 16pt;
                   font-style : normal;
                   font-weight : bold;
                   line-height : 18pt;
               }
               .hang15 {
                   margin-left : 40px;
                   text-indent : -15px;
               }
               .hang25 {
                   margin-left : 40px;
                   text-indent : -25px;
               }
               .hang35 {
                   margin-left : 40px;
                   text-indent : -35px;
               }
               table {
                   text-align : right;
               }
               .sictoggle {
               display:none;
               }
               .corrtoggle {
               display:none;
               }
            </style>
            <!--FONTS-->
            <link href='http://fonts.googleapis.com/css?family=Droid+Sans:400,700' rel='stylesheet' type='text/css'/>
            <link href='http://fonts.googleapis.com/css?family=Fanwood+Text' rel='stylesheet' type='text/css'/>
                   
         </head>
         
         <!-- Build the body of the HTML document, beginning with the masthead used in the
         project Web site. -->
         
         <body>
            <!-- Build the masthead and navigation links at the top of the page -->
            <div class="masthead">
               <div class="mastheadl">
                  <p>
                     <a href="LCSmithReading.html" title="Reading Text of the
                        Smith Diaries">Reading Text</a><br/>
                     <a href="LCSmithDiplomatic.html" title="Diplomatic View of the
                        Smith Diaries">Diplomatic View</a><br/>
                     <a href="LCSmithCombined.html" title="Side-by-side view of
                        page images and diplomatic transcription">Facsimile/Text View</a><br/>
                     <a
                        href="http://people.cohums.ohio-state.edu/ulman1/LCSmithDiaries/default.cfm"
                        title="Background information about the project.">Project Web Site</a><br/>
                     <a href="#view">About this Page</a>
                  </p>
               </div>
               <div class="mastheadc">
                  <img src="https://images.asc.ohio-state.edu/is/image/englishdocs/1/1b4c862c-36e6-4189-8825-d5972bedfc1e.jpg?scale=0.2&amp;rgn=0,0,120,146&amp;fmt=png" height="100" alt="Portrait of Lucius C. Clark"/>&#xA0;&#xA0;<img
                        src="https://images.asc.ohio-state.edu/is/image/englishdocs/d/d64bea81-daaf-41cc-975b-88bdfe839567.jpg?scale=0.2&amp;rgn=200,380,250,100&amp;fmt=png"
                        alt="Manuscript detail" name="MSDetail" id="MSDetail"/>&#xA0;&#xA0;<img src="https://images.asc.ohio-state.edu/is/image/englishdocs/0/0ca173b2-3165-4fdf-babc-895c20be69f9.jpg?scale=0.1&amp;rgn=0,0,210,150&amp;fmt=png" width="150" alt="Open book"/>
               </div>
               <div class="mastheadr"> 
                  <p>
                     <a href="LCSmithEdIntro.html" title="Editorial Introduction
                        to the Lucius Clark Smith Diaries">Editorial Intro</a><br/>
                     <a
                        href="LCSmithEdIntro.html#PeopleMentioned" 
                        title="List of people mentioned in the diaries."
                        target="_blank">People Mentioned</a><br />
                     <a href="LCSmithEdIntro.html#PlacesMentioned"
                        title="List of places mentioned in the diaries.">Places Mentioned</a><br />
                     <a href="LCSmithEdIntro.html#WorksCited" 
                        title="List of works cited in explanatory annotations and editorial introduction.">Works Cited</a>
                  </p>
               </div>
            </div>
            <div style="clear:both;"/><br/>
            <hr/>
            <p align="center">
               <span class="ProjectTitle">
                  <xsl:apply-templates
                     select="/tei:teiCorpus/tei:teiHeader/tei:fileDesc/tei:titleStmt/tei:title"/>
               </span>
            </p>
            <p align="center"><cite><strong>This edition is currently in progress. Please do
               not cite this preview until this notice is removed.</strong></cite><br/><br/>
               <button>Toggle diplomatic and standardized orthography</button>
            </p>
            <hr/>
            
            <!-- Apply templates to the tei:body. -->
            <xsl:apply-templates select="/tei:TEI/tei:text/tei:body"/>
                        
            <!-- Insert, count, encode by cardinal position, and link the explanatory annotations. -->
            <hr/>
            <h2>Explanatory Annotations</h2>
            <xsl:for-each select="//tei:body//tei:note[@resp='ed']">
               <xsl:choose>
                  <xsl:when test="position()>=100">
                     <p class="hang35"><a>
                        <xsl:attribute name="name">n<xsl:value-of select="@xml:id"/></xsl:attribute>
                        </a>
                        <xsl:number count="//tei:body//tei:note[@resp='ed']" level="any"
                        />.&#xA0;<xsl:apply-templates/>
                        <a>
                           <xsl:attribute name="href">#p<xsl:value-of select="@xml:id"/></xsl:attribute>
                           <xsl:attribute name="class">annotation</xsl:attribute>
                           [Back]
                        </a>
                     </p>
                  </xsl:when>
                  <xsl:when test="position()>=10">
                     <p class="hang25"><a>
                        <xsl:attribute name="name">n<xsl:value-of select="@xml:id"/></xsl:attribute>
                        </a>
                        <xsl:number count="//tei:body//tei:note[@resp='ed']" level="any"
                        />.&#xA0;<xsl:apply-templates/>
                        <a>
                           <xsl:attribute name="href">#p<xsl:value-of select="@xml:id"/></xsl:attribute>
                           <xsl:attribute name="class">annotation</xsl:attribute>
                           [Back]
                        </a>
                     </p>
                  </xsl:when>
                  <xsl:otherwise>
                     <p class="hang15"><a>
                           <xsl:attribute name="name">n<xsl:value-of select="@xml:id"/></xsl:attribute>
                        </a>
                        <xsl:number count="//tei:body//tei:note[@resp='ed']" level="any"/>.&#xA0;<xsl:apply-templates/>
                        <a>
                           <xsl:attribute name="href">#p<xsl:value-of select="@xml:id"/></xsl:attribute>
                           <xsl:attribute name="class">annotation</xsl:attribute>
                           [Back]
                        </a>
                     </p>
                  </xsl:otherwise>
               </xsl:choose>

            </xsl:for-each>
            
            <hr/>
            <a name="WorksCited"/>
            <h2>List of Works Cited</h2>
            <xsl:apply-templates
               select="tei:TEI/tei:teiHeader/tei:fileDesc/tei:sourceDesc/tei:listBibl"/>
            <hr/>
            <!-- Describe this view of the journal. -->
            <h2>About this View of the Journal</h2>
            <p><a name="view"/><xsl:value-of select="$aboutView"/></p>
            <hr/>
            <!-- Insert link to home page, creation date, and licensing statement.-->
            <p align="left">
               <a href="http://people.cohums.ohio-state.edu/ulman1/LCSmithDiaries/default.cfm"
                  target="self">Home</a>
               <br/>
               <br/>
               <emph>Created: <xsl:apply-templates
                     select="//tei:teiCorpus/tei:teiHeader/tei:profileDesc/tei:creation/tei:date"
                  /></emph>
            </p>
            <p align="center">
               <xsl:value-of
                  select="//tei:teiCorpus/tei:teiHeader/tei:availability/tei:p[@id='CreativeCommons']"
                  disable-output-escaping="yes"/>
            </p>
         </body>
      </html>
   </xsl:template>

   <!-- MAJOR DOCUMENT STRUCTURES: These elements include the front, body, and back
      elements of you XML documents in the result tree of your output.-->

   <xsl:template match="tei:div[@type='Entry']">
         <div class="Entry">
            <xsl:element name="a"><xsl:attribute name="name"><xsl:value-of select="@xml:id"/></xsl:attribute></xsl:element>
            <xsl:apply-templates/>
         </div>
   </xsl:template>
   <xsl:template match="tei:div[@type='Entry']/tei:dateline">
      <strong>
         <xsl:apply-templates/>
      </strong>
   </xsl:template>
   

   <!-- PAGE, COLUMN, AND LINE BREAKS; Page Layout: These template rules determine how page breaks and
      line breaks will be encoded, or whether they will be included, in your Web page. -->

   <xsl:template match="tei:ab/tei:persName">
      <br/><xsl:apply-templates/>
   </xsl:template>
   <xsl:template match="tei:addrLine">
      <br/><xsl:apply-templates/>
   </xsl:template>
   <xsl:template match="tei:div[@type='letter']/tei:head">
      <p><xsl:apply-templates/></p>
   </xsl:template>
   <!-- Template rule for editorial divs in back matter -->

   <xsl:template match="tei:div[@type='editorial']">
      <hr/>
      <br/>
      <a>
         <xsl:attribute name="name">
            <xsl:value-of select="@xml:id"/>
         </xsl:attribute>
      </a>
      <xsl:apply-templates/>
   </xsl:template>
   <xsl:template match="tei:div[@type='editorial']/tei:head">
      <h1>
         <xsl:apply-templates/>
      </h1>
   </xsl:template>

   <!-- SORTING AND FORMATTING LISTS OF WORKS CITED, PLACES, ORGANIZATIONS, AND SO ON. -->

   <xsl:template match="//tei:listBibl">
      <xsl:for-each select="tei:bibl">
         <xsl:sort select="@n"/>
         <p class="hang25">
            <a>
               <xsl:attribute name="name">
                  <xsl:value-of select="@xml:id"/>
               </xsl:attribute>
            </a>
            <xsl:apply-templates/>
         </p>
      </xsl:for-each>
   </xsl:template>
   <xsl:template match="tei:note[@type='introductory']//tei:bibl">(<xsl:apply-templates/>)</xsl:template>
   <xsl:template match="tei:note[@resp='ed']//tei:bibl">(<xsl:apply-templates/>)</xsl:template>
   <xsl:template match="tei:ref"><xsl:apply-templates/></xsl:template>
   <xsl:template match="tei:title[@level='a']">"<xsl:apply-templates/>"</xsl:template>
   <xsl:template match="tei:title[@level='m']">
      <cite>
         <xsl:apply-templates/>
      </cite>
   </xsl:template>
   <xsl:template match="tei:title[@level='j']">
      <cite>
         <xsl:apply-templates/>
      </cite>
   </xsl:template>
   <xsl:template match="tei:listPlace">
      <xsl:for-each select="tei:place">
         <xsl:sort select="tei:geogName"/>
         <xsl:sort select="tei:placeName"/>
         <p>
            <xsl:if test="tei:geogName[1]"><strong><xsl:value-of select="tei:geogName[1]"
               /></strong></xsl:if>
            <xsl:if test="tei:geogName[2]"> (<xsl:value-of select="tei:geogName[2]"/>)</xsl:if>
            <xsl:if test="tei:placeName[1]"><strong><xsl:value-of select="tei:placeName[1]"
                  /></strong></xsl:if>
            <xsl:if test="tei:placeName[2]"> (<xsl:value-of select="tei:placeName[2]"/>)</xsl:if>.
               <xsl:value-of select="tei:country"/>
            <xsl:if test="tei:region">; <xsl:value-of select="tei:region"/></xsl:if>
            <xsl:if test="tei:location/tei:geo"> (Lat/Long: <xsl:value-of
                  select="tei:location/tei:geo"/>)</xsl:if>. <xsl:value-of select="tei:desc"/>
         </p>
      </xsl:for-each>
   </xsl:template>

   <!-- ANNOTATIONS -->

   <xsl:template match="tei:TEI//tei:ptr[@type='noteAnchor']">
      <a>
         <xsl:attribute name="name">p<xsl:value-of select="@target"></xsl:value-of>
         </xsl:attribute>
      </a>
      <a>
         <xsl:attribute name="href">#n<xsl:value-of select="@target"/></xsl:attribute>
         <xsl:attribute name="class">annotation</xsl:attribute>
         <xsl:attribute name="title"><xsl:value-of select="normalize-space(following::tei:note[1])"></xsl:value-of></xsl:attribute>
         <sup>
            <xsl:number level="any" count="tei:TEI//tei:ptr[@type='noteAnchor']"/>
            <xsl:apply-templates/>
         </sup>
      </a>
   </xsl:template>
   <xsl:template match="tei:note[@xml:id]"/>

   <!-- MSS ITEMS: These rules process various tags particularly relevant to 
      transcriptions of primary handwritten materials. -->

   <!-- Handshifts -->
<!--   <xsl:template match="tei:handShift"> [<xsl:value-of select="@new"/>] </xsl:template>-->
   <xsl:template match="tei:handShift"/>

   <!-- Gaps in your transcript of the source text (tears in the page, and so on). -->
   <xsl:template match="tei:gap">
      <xsl:apply-templates/>[ .&#xA0;.&#xA0;. ] </xsl:template>
   <xsl:template match="tei:damage"> [<em>Damage: <xsl:value-of select="@agent"/> (<xsl:value-of
            select="@extent"/>
         <xsl:value-of select="@unit"/>)</em>] </xsl:template>

   <!-- Editorial emendations -->
   <xsl:template match="tei:supplied">[<xsl:apply-templates/>] </xsl:template>

   <!-- Additions by the author or another hand. -->
   <xsl:template match="tei:add">
      <xsl:apply-templates/>
   </xsl:template>

   <!-- Unclear passages. -->
   <xsl:template match="tei:unclear"> [<xsl:apply-templates/>?] </xsl:template>

   <!-- Nonstandard or erroneous text for which you have encoded a correct or regularized alternative. -->
   <xsl:template match="tei:choice/tei:orig">
      <xsl:apply-templates/>
   </xsl:template>
   <xsl:template match="tei:choice/tei:reg"/>
   <xsl:template match="tei:distinct[@type='babyTalk']">
      <xsl:apply-templates/> [sic] 
   </xsl:template>

   <!--MISCELLANEOUS TEXTUAL FEATURES. -->

   <!-- Quotes -->
   <xsl:template match="tei:q">
      <q>
      <xsl:apply-templates/>
      </q>
   </xsl:template>
   <xsl:template match="//tei:quote[@type='blockquote']">
      <p class="blockquote">
         <xsl:apply-templates/>
      </p>
   </xsl:template>

   <!-- Choice Elements -->
   <xsl:template match="tei:choice/tei:abbr">
      <xsl:apply-templates/>
   </xsl:template>
   <xsl:template match="tei:choice/tei:expan"/>
   <xsl:template match="tei:choice/tei:sic">
      <span class="sic"><xsl:apply-templates/>[sic]</span>
   </xsl:template>
   <xsl:template match="tei:choice/tei:corr">
      <span class="corr corrtoggle"><xsl:apply-templates/></span>
   </xsl:template>
   

   <!-- Passages in languages other than your document's base language. -->
   <xsl:template match="tei:foreign">
      <em>
         <xsl:apply-templates/>
      </em>
   </xsl:template>

   <!-- Names -->
   <xsl:template match="tei:rs">
      <xsl:apply-templates/>
   </xsl:template>
   <xsl:template match="tei:note/tei:name[@type='ship']">
      <em>
         <xsl:apply-templates/>
      </em>
   </xsl:template>
   <xsl:template match="tei:person/tei:name[@type='ship']">
      <em>
         <xsl:apply-templates/>
      </em>
   </xsl:template>

   <!-- Text highlighted in the source document -->

   <xsl:template match="tei:hi[@rend='underlined']">
      <U>
         <xsl:apply-templates/>
      </U>
   </xsl:template>
   <xsl:template match="tei:hi[@rend='superscript']">
      <sup>
         <xsl:apply-templates/>
      </sup>
   </xsl:template>

   <!-- LINK OR EMBED IMAGES AND OTHER NON-TEXTUAL MATERIALS -->

   <xsl:template match="tei:figure[@rend='link']"> [<a>
         <xsl:attribute name="HREF">
            <xsl:value-of select="tei:graphic/@url"/>
         </xsl:attribute>
         <xsl:attribute name="alt">
            <xsl:value-of select="tei:figDesc"/>
         </xsl:attribute>
         <xsl:attribute name="target">blank</xsl:attribute>
         <xsl:value-of select="tei:head"/>
      </a>]. </xsl:template>

</xsl:stylesheet>
