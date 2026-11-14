document.addEventListener('DOMContentLoaded', () => {
 document.querySelector('[data-view-pdf]')?.addEventListener('click', async event => {
  const button=event.currentTarget;button.disabled=true;
  try {
   const {PDFDocument,StandardFonts,rgb}=window.PDFLib,doc=await PDFDocument.create(),font=await doc.embedFont(StandardFonts.Helvetica),bold=await doc.embedFont(StandardFonts.HelveticaBold);
   const safe=value=>String(value||'').replace(/[^\x20-\x7e\xa0-\xff]/g,' '),table=document.querySelector('table');
   const headers=[...table.querySelectorAll('thead th')].map(c=>safe(c.textContent).trim());
   const rows=[...table.tBodies[0].rows].filter(r=>r.cells.length===headers.length).map(r=>[...r.cells].map(c=>safe(c.textContent).trim()));
   const width=778/headers.length,padding=7,lineHeight=13;let page,y;
   const wrap=(text,face=font)=>{const lines=[];let line='';for(const ch of text||' '){if(face.widthOfTextAtSize(line+ch,9)>width-2*padding&&line){lines.push(line);line='';}line+=ch;}lines.push(line);return lines;};
   const draw=(cells,header=false,start=0,limit=Infinity)=>{const count=Math.min(Math.max(...cells.map(c=>c.length))-start,limit),height=count*lineHeight+2*padding;
    if(header)page.drawRectangle({x:32,y:y-height,width:778,height,color:rgb(.91,.96,.96)});
    cells.forEach((lines,col)=>lines.slice(start,start+count).forEach((line,i)=>page.drawText(line,{x:32+col*width+padding,y:y-padding-9-i*lineHeight,size:9,font:header?bold:font})));
    y-=height;page.drawLine({start:{x:32,y},end:{x:810,y},thickness:.4,color:rgb(.78,.84,.85)});
   };
   const next=()=>{page=doc.addPage([842,595]);y=554;page.drawText('OceanLink',{x:32,y,size:19,font:bold,color:rgb(.03,.25,.35)});page.drawText('Reporte operativo',{x:150,y:y+2,size:12,font});y-=27;
    page.drawText(safe(document.querySelector('.panel-heading p')?.textContent).slice(0,130),{x:32,y,size:9,font});y-=22;draw(headers.map(t=>wrap(t,bold)),true);page.drawText('Página '+doc.getPageCount(),{x:750,y:18,size:8,font});
   };next();
   for(const row of rows){const cells=row.map(t=>wrap(t)),length=Math.max(...cells.map(c=>c.length));
    if(length*lineHeight+2*padding<=420&&y-length*lineHeight-2*padding<36)next();
    let offset=0;while(offset<length){const available=Math.floor((y-36-2*padding)/lineHeight);if(available<1){next();continue;}const count=Math.min(available,length-offset);draw(cells,false,offset,count);offset+=count;if(offset<length)next();}
   }
   const url=URL.createObjectURL(new Blob([await doc.save()],{type:'application/pdf'})),modal=document.createElement('dialog');modal.className='pdf-dialog';
   modal.innerHTML='<div class="modal-header"><h2>Reporte PDF</h2><button class="secondary-button" type="button">Cerrar</button></div><iframe title="PDF del reporte"></iframe><a class="primary-button" download="OceanLink-reporte.pdf">Descargar PDF</a>';
   modal.querySelector('iframe').src=url;modal.querySelector('a').href=url;modal.querySelector('button').onclick=()=>modal.close();modal.addEventListener('close',()=>{URL.revokeObjectURL(url);modal.remove();});document.body.append(modal);modal.showModal();
  }catch(error){button.textContent='No se pudo generar el PDF. Reintentar';console.error(error);}finally{button.disabled=false;}
 });
 if(new URLSearchParams(location.search).get('pdf')==='1')document.querySelector('[data-view-pdf]')?.click();
});
