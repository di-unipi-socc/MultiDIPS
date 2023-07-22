import templates as t
from os.path import join, dirname, exists
from os import makedirs
import parse as p
import click
from typing import List
import copy

DISC_PREDICATES = {'intent': 4, 'propertyExpectation': 5, 'propertyExpectation#': 8, 'target': 2, 'vnf': 3, 'vnfXUser': 4}

class Intent():
    def __init__(self, stakeholder : str, intentId: str, nUsers: int, targetId: str):
        self.stakeholder = stakeholder
        self.intentId = intentId
        self.nUsers = nUsers
        self.targetId = targetId

    def __eq__(self, other):
        if not isinstance(other, Intent):
            return False
        return self.stakeholder==other.stakeholder and self.intentId == other.intentId

    def __str__(self):
        out = t.INTENT.format(stakeholder = self.stakeholder, intentId=self.intentId, nUsers=self.nUsers, targetId=self.targetId)
        return out
    
    def __repr__(self):
        return self.__str__()


class ChangingProperty():
    def __init__(self, intentId: str, property: str, bound: str, From: str, To: str):
        self.intentId = intentId
        self.property = property
        self.bound = bound
        self.From = From
        self.To = To

    def __eq__(self, other):
        if not isinstance(other, ChangingProperty):
            return False
        return self.intentId == other.intentId and self.property==other.property and self.bound==other.bound and self.From==other.From and self.To==other.To

    def __str__(self):
        out = t.CHANGING_PROPERTY.format(intentId=self.intentId, property=self.property, bound=self.bound, From=self.From, To=self.To)
        return out
    
    def __repr__(self):
        return self.__str__()
    
    
class NonChangingProperty():
    def __init__(self, intentId: str, property: str, bound: str, level: str, value : float, unit : str, From: str, To: str):
        self.intentId = intentId
        self.property = property
        self.bound = bound
        self.level = level
        self.value = value
        self.unit = unit
        self.From = From
        self.To = To

    def __eq__(self, other):
        if not isinstance(other, NonChangingProperty):
            return False
        return self.intentId == other.intentId and self.property==other.property and self.bound==other.bound and self.level==other.level and self.value==other.value and self.unit==other.unit and self.From==other.From and self.To==other.To

    def __str__(self):
        out = t.NON_CHANGING_PROPERTY.format(intentId=self.intentId, property=self.property, bound=self.bound, level=self.level,
                                            value=self.value, unit=self.unit, From=self.From, To=self.To) 
        return out
    
    def __repr__(self):
        return self.__str__()
    

class Target():
    def __init__(self, targetId: str, targetChain: list):
        self.targetId = targetId
        self.targetChain = targetChain

    def __eq__(self, other):
        if not isinstance(other, Target):
            return False
        return self.targetId == other.targertId

    def __str__(self):
        out = t.TARGET.format(targetId=self.targetId, targetChain=self.targetChain) 
        return out
    
    def __repr__(self):
        return self.__str__()
    

class Vnf():
    def __init__(self, id: str, level: str, processTime: int):
        self.id = id
        self.level = level
        self.processTime = processTime

    def __eq__(self, other):
        if not isinstance(other, Vnf):
            return False
        return self.id == other.id and self.level==other.level 

    def __str__(self):
        out = t.VNF.format(id=self.id, level=self.level, processTime=self.processTime) 
        return out
    
    def __repr__(self):
        return self.__str__()
    
    
class VnfXUsers():
    def __init__(self, id: str, version: str, usersRange: tuple, HWReqs: tuple):
        self.id = id
        self.version = version
        self.usersRange = usersRange
        self.HWReqs = HWReqs

    def __eq__(self, other):
        if not isinstance(other, VnfXUsers):
            return False
        return self.id == other.id and self.version==other.version

    def __str__(self):
        out = t.VNFXUSERS.format(id=self.id, version=self.version, usersRange=self.usersRange, HWReqs= self.HWReqs) 
        return out
    
    def __repr__(self):
        return self.__str__()


class Intents():
    def __init__(self, readPath: str, writePath: str, size: int = 0):
        self._size = size
        self.id = f"intents{self._size}.pl"
        self._intents: dict(str, Intent) = {}
        self._targets: dict(str, Target) = {}
        self._changingProperties: dict(str, List[ChangingProperty]) = {}
        self._nonChangingProperties: dict(str, List[NonChangingProperty]) = {}
        self._vnfs: dict(str, List[Vnf]) = {}
        self._vnfsXusers: dict(str, List[VnfXUsers]) = {}
        self.fileRead = readPath
        self.fileWrite = join(writePath, f"{self.id}")

    def add_intent(self, intent: Intent):
        if intent.intentId not in self._intents:
            self._intents[intent.intentId] = intent

    def add_target(self, target: Target):
        if target.targetId not in self._targets:
            self._targets[target.targetId] = target

    def add_changingProperty(self, Cproperty: ChangingProperty):
        if Cproperty.intentId in self._changingProperties:
            cpropertyList = self._changingProperties[Cproperty.intentId]
            if Cproperty not in cpropertyList:
                self._changingProperties[Cproperty.intentId].append(Cproperty)
        else:
            self._changingProperties[Cproperty.intentId] = [Cproperty]
        
    def add_nonChangingProperty(self, NCproperty: NonChangingProperty):
        if NCproperty.intentId in self._nonChangingProperties:
            ncpropertyList = self._nonChangingProperties[NCproperty.intentId]
            if NCproperty not in ncpropertyList:
                self._nonChangingProperties[NCproperty.intentId].append(NCproperty)
        else:
            self._nonChangingProperties[NCproperty.intentId] = [NCproperty]

    def add_vnf(self, vnf: Vnf):
        if vnf.id in self._vnfs:
            vnfList = self._vnfs[vnf.id]
            if vnf not in vnfList:
                self._vnfs[vnf.id].append(vnf)
        else:
            self._vnfs[vnf.id] = [vnf]

    def add_vnfXusers(self, vnfXusers: VnfXUsers):
        if vnfXusers.id in self._vnfsXusers:
            vnfXusersList = self._vnfsXusers[vnfXusers.id]
            if vnfXusers not in vnfXusersList:
                self._vnfsXusers[vnfXusers.id].append(vnfXusers)
        else:
            self._vnfsXusers[vnfXusers.id] = [vnfXusers]

    def _get_discontiguous(self):
        return "\n".join(t.DISCONTIGUOUS.format(s.replace('#',''), d) for s, d in DISC_PREDICATES.items())+"\n"
    
    def _get_intents(self, num):
        out = ""
        for s in self._intents.values():
            sCopy = copy.deepcopy(s)
            sCopy.stakeholder = sCopy.stakeholder + str(num)
            sCopy.intentId = sCopy.intentId + str(num) 
            out += str(sCopy) + "\n"
        return out
    
    def _get_targets(self):
        return "\n".join([str(s) for s in self._targets.values()])
    
    def _get_changingProperties(self, num):
        out = ""
        for dictList in self._changingProperties.values():
            out += "\n"
            for s in dictList:
                sCopy = copy.deepcopy(s)
                sCopy.intentId= sCopy.intentId + str(num) 
                out += str(sCopy) + "\n"
        return out
    
    def _get_nonChangingProperties(self, num):
        out = ""
        for dictList in self._nonChangingProperties.values():
            out += "\n"
            for s in dictList: 
                sCopy = copy.deepcopy(s)
                sCopy.intentId= sCopy.intentId + str(num) 
                out += str(sCopy) + "\n"
        return out
    
    def _get_vnfs(self):
        out = "\n"
        for dictList in self._vnfs.values():
            for s in dictList: 
                out += str(s) + "\n"
        return out
    
    def _get_vnfsXusers(self):
        out = ""
        for dictList in self._vnfsXusers.values():
            out += "\n"
            for s in dictList: 
                out += str(s) + "\n"
        return out
    
    def __str__(self):
        out = self._get_discontiguous() + "\n"
        for i in range(1, (self._size//5 +1)):
            out += self._get_intents(i) 
            out += self._get_changingProperties(i)
            out += self._get_nonChangingProperties(i) + "\n"
        out += self._get_targets() + "\n"
        out += self._get_vnfs()
        out += self._get_vnfsXusers()
        return out
    
    def __repr__(self):
        return self.__str__()
    
    def parse(self):
        if not exists(self.fileRead):
            raise FileNotFoundError(f"File {self.fileRead} not found.")
        else:
            with open(self.fileRead, "r") as f:
                lines = f.read().splitlines()

                for i in range(len(lines)):
                    lines[i] = lines[i].strip()
                
                self.parse_intent([i for i in lines if i.startswith("intent(")])
                self.parse_property([i for i in lines if i.startswith("propertyExpectation(")])
                self.parse_target([i for i in lines if i.startswith("target(")])
                self.parse_vnf([i for i in lines if i.startswith("vnf(")])
                self.parse_vnfXusers([i for i in lines if i.startswith("vnfXUser(")])


    def parse_intent(self, intents):
        for intent in intents:
            intent = p.parse(t.INTENT, intent)
            if intent:
                stakeholder = intent["stakeholder"]
                intentId = intent["intentId"]
                nUsers = intent["nUsers"]
                targetId = intent["targetId"]

                self.add_intent(Intent(stakeholder=stakeholder, intentId=intentId, nUsers=nUsers, targetId=targetId))
            else:
                raise t.ParseError(f"Error parsing intent {intent}")
    

    def parse_property(self, properties):
        for property in properties:
            NCproperty = p.parse(t.NON_CHANGING_PROPERTY, property)
            if NCproperty:
                intentId = NCproperty["intentId"]        
                property = NCproperty["property"]
                bound = NCproperty["bound"]
                level = NCproperty["level"]
                value = NCproperty["value"]
                unit = NCproperty["unit"]
                From = NCproperty["From"]
                To = NCproperty["To"]
                self.add_nonChangingProperty(NonChangingProperty(intentId=intentId, property=property, bound=bound, level=level,
                                                                 value=value, unit=unit, From=From, To=To))
            else:
                Cproperty = p.parse(t.CHANGING_PROPERTY, property)
                if Cproperty:
                    intentId = Cproperty["intentId"]        
                    property = Cproperty["property"]
                    bound = Cproperty["bound"]
                    From = Cproperty["From"]
                    To = Cproperty["To"]
                    self.add_changingProperty(ChangingProperty(intentId=intentId, property=property, bound=bound, From=From, To=To))

                else:
                    raise t.ParseError(f"Error parsing property {property}")


    def parse_target(self, targets):
        for target in targets:
            target = p.parse(t.TARGET, target)
            if target:
                targetId = target["targetId"]
                targetChain = target["targetChain"]

                self.add_target(Target(targetId=targetId, targetChain=targetChain))
            else:
                raise t.ParseError(f"Error parsing application {target}")
            

    def parse_vnf(self, vnfs):
        for vnf in vnfs:
            vnf = p.parse(t.VNF, vnf)
            if vnf:
                id = vnf["id"]
                level = vnf["level"]
                processTime = vnf["processTime"]

                self.add_vnf(Vnf(id=id, level=level, processTime=processTime))
            else:
                raise t.ParseError(f"Error parsing application {vnf}")


    def parse_vnfXusers(self, vnfsXUsers):
        for vnfXusers in vnfsXUsers:
            vnfXusers = p.parse(t.VNFXUSERS, vnfXusers)
            if vnfXusers:
                id = vnfXusers["id"]
                version = vnfXusers["version"]
                usersRange = vnfXusers["usersRange"]
                HWReqs = vnfXusers["HWReqs"]

                self.add_vnfXusers(VnfXUsers(id=id, version=version, usersRange=usersRange, HWReqs=HWReqs))
            else:
                raise t.ParseError(f"Error parsing application {vnfXusers}")
            

    def upload(self):
        makedirs(dirname(self.fileWrite)) if not exists(dirname(self.fileWrite)) else None		
        with open(self.fileWrite, "w+") as f:
            f.write(str(self))

@click.command()
@click.argument("sizes", type=int, nargs=-1)
@click.option("--readpath", "-rp", type=click.Path(exists=True, writable=True), default=t.SRC_INTENT_DIR, help="Directory path to read the intents.")
@click.option("--writepath", "-wp", type=click.Path(exists=True, writable=True), default=t.INTENTS_DIR, help="Directory path to write the intents.")
def main(sizes, readpath, writepath):
    for size in sizes:
        if size % 5 != 0:
            print(str(size) + " is not a multiple of 5. Size must be a multiple of 5.")
        else:
            intents = Intents(size=size, readPath=readpath, writePath=writepath)
            intents.parse() 
            intents.upload()
            print(f"{intents._size} intent generated.")


if __name__ == "__main__":
	main()