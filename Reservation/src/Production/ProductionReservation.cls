Class Production.ProductionReservation Extends Ens.Production
{

XData ProductionDefinition
{
<Production Name="Production.ProductionReservation" LogGeneralTraceEvents="false">
  <Description></Description>
  <ActorPoolSize>1</ActorPoolSize>
  <Item Name="Voiture" Category="" ClassName="BO.Voiture" PoolSize="1" Enabled="true" Foreground="false" Comment="" LogTraceEvents="false" Schedule="">
    <Setting Target="Host" Name="InactivityTimeout">0</Setting>
  </Item>
  <Item Name="ServiceVoiture" Category="" ClassName="BS.ServiceVoiture" PoolSize="0" Enabled="true" Foreground="false" Comment="" LogTraceEvents="false" Schedule="">
  </Item>
</Production>
}

}
