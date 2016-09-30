#!/bin/bash


#arguments
minJob=$1
maxJob=$2
exclString=$3
dataDir=$4

#macros
filePrefix="cmsRun-stdout-"
suffix=".log"

#totals
nTotal=0
nMuonIWant=0
nHighestPtAndMuonOppositeSignDRSelector=0
nMu1Mu2PtRankMuonID=0
nIsolation=0
nPtEtaCut=0
nMu45Selector=0
nMu3=0
nMu3ID=0
ntauMuonPtSelector=0
nmuHadTauSelector=0
Jobs="1 10 100 101 102 103 104 105 106 107 108 109 11 110 111 112 113 114 115 116 117 118 119 12 120 121 122 123 124 125 126 127 128 129 13 130 131 132 133 134 136 137 138 139 14 141 142 143 144 145 146 147 148 15 150 151 152 153 154 155 156 157 158 159 16 160 161 162 163 164 165 166 167 168 169 17 170 171 172 173 174 175 176 177 178 179 18 180 181 182 184 185 186 187 188 189 19 190 191 192 193 194 195 196 197 198 199 2 20 200 201 202 203 204 205 206 207 208 209 21 210 211 212 213 214 215 216 217 218 219 22 220 221 222 223 224 225 226 227 228 229 23 230 231 232 233 234 235 236 237 238 239 24 240 241 242 243 244 245 246 247 248 249 25 250 251 252 253 254 255 256 257 258 259 26 260 261 262 263 264 265 266 267 268 269 27 270 271 272 273 274 275 276 277 278 279 28 280 281 282 283 284 285 29 3 30 31 32 33 34 35 36 37 38 39 4 40 41 42 43 44 45 46 47 48 49 5 50 51 52 53 54 55 56 57 58 59 6 60 61 62 63 64 65 66 67 68 69 7 70 71 72 73 74 75 76 77 78 79 8 80 81 82 83 84 85 86 87 88 89 9 90 91 92 93 94 95 96 97 98 99"
for iJob in ${Jobs}
  do
  nTotal=`grep MuonIWant ${filePrefix}${iJob}${suffix} | head -n 1 | sed -e "s%TrigReport[ ]*1[ ]*0[ ]*\([0-9]*\)[ ]*[0-9]*.*%\1%"`
  nMuonIWant=`grep MuonIWant ${filePrefix}${iJob}${suffix} | head -n 1 | sed -e "s%TrigReport[ ]*1[ ]*0[ ]*[0-9]*[ ]*\([0-9]*\).*%\1%"`
  nHighestPtAndMuonOppositeSignDRSelector=`grep HighestPtAndMuonOppositeSignDRSelector ${filePrefix}${iJob}${suffix} | head -n 1 | sed -e "s%TrigReport[ ]*1[ ]*1[ ]*[0-9]*[ ]*\([0-9]*\).*%\1%"`
  nMu1Mu2PtRankMuonID=`grep Mu1Mu2PtRankMuonID ${filePrefix}${iJob}${suffix} | head -n 1 | sed -e "s%TrigReport[ ]*1[ ]*2[ ]*[0-9]*[ ]*\([0-9]*\).*%\1%"`
  nIsolation=`grep Isolation ${filePrefix}${iJob}${suffix} | head -n 1 | sed -e "s%TrigReport[ ]*1[ ]*3[ ]*[0-9]*[ ]*\([0-9]*\).*%\1%"`
  nPtEtaCut=`grep PtEtaCut ${filePrefix}${iJob}${suffix} | head -n 1 | sed -e "s%TrigReport[ ]*1[ ]*4[ ]*[0-9]*[ ]*\([0-9]*\).*%\1%"`
  nMu45Selector=`grep Mu45Selector ${filePrefix}${iJob}${suffix} | head -n 1 | sed -e "s%TrigReport[ ]*1[ ]*5[ ]*[0-9]*[ ]*\([0-9]*\).*%\1%"`
  nMu3=`grep "0 Mu3" ${filePrefix}${iJob}${suffix} | head -n 1 | sed -e "s%TrigReport[ ]*1[ ]*6[ ]*[0-9]*[ ]*\([0-9]*\).*%\1%"`
  nMu3ID=`grep Mu3ID ${filePrefix}${iJob}${suffix} | head -n 1 | sed -e "s%TrigReport[ ]*1[ ]*7[ ]*[0-9]*[ ]*\([0-9]*\).*%\1%"`
  ntauMuonPtSelector=`grep tauMuonPtSelector ${filePrefix}${iJob}${suffix} | head -n 1 | sed -e "s%TrigReport[ ]*1[ ]*8[ ]*[0-9]*[ ]*\([0-9]*\).*%\1%"`
  nmuHadTauSelector=`grep muHadTauSelector ${filePrefix}${iJob}${suffix} | head -n 1 | sed -e "s%TrigReport[ ]*1[ ]*106[ ]*[0-9]*[ ]*\([0-9]*\).*%\1%"`

  #increment totals
  nTotalTot=`expr $nTotalTot + $nTotal`
  nMuonIWantTot=`expr $nMuonIWantTot + $nMuonIWant`
  nHighestPtAndMuonOppositeSignDRSelectorTot=`expr $nHighestPtAndMuonOppositeSignDRSelectorTot + $nHighestPtAndMuonOppositeSignDRSelector`
  nMu1Mu2PtRankMuonIDTot=`expr $nMu1Mu2PtRankMuonIDTot + $nMu1Mu2PtRankMuonID`
  nIsolationTot=`expr $nIsolationTot + $nIsolation`
  nPtEtaCutTot=`expr $nPtEtaCutTot + $nPtEtaCut`
  nMu45SelectorTot=`expr $nMu45SelectorTot + $nMu45Selector`
  nMu3Tot=`expr $nMu3Tot + $nMu3`
  echo ${iJob}
  echo $nMu1Mu2PtRankMuonID
  nMu3IDTot=`expr $nMu3IDTot + $nMu3ID`
  ntauMuonPtSelectorTot=`expr $ntauMuonPtSelectorTot + $ntauMuonPtSelector`
  nmuHadTauSelectorTot=`expr $nmuHadTauSelectorTot + $nmuHadTauSelector`
done

#print totals
echo "nTotal = $nTotalTot"
echo "nMuonIWant = $nMuonIWantTot"
echo "nHighestPtAndMuonOppositeSignDRSelector = $nHighestPtAndMuonOppositeSignDRSelectorTot"
echo "nMu1Mu2PtRankMuonID = $nMu1Mu2PtRankMuonIDTot"
echo "nIsolation= $nIsolationTot"
echo "nPtEtaCut = $nPtEtaCutTot"
echo "nMu45Selector = $nMu45SelectorTot"
echo "nMu3 = $nMu3Tot"
echo "nMu3ID = $nMu3IDTot"
echo "ntauMuonPtSelector = $ntauMuonPtSelectorTot"
echo "nmuHadTauSelector = $nmuHadTauSelectorTot"
exit 0
