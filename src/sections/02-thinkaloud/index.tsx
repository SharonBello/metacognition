// ═══════════════════════════════════════════════════════════════════
// Section 02 — הפער (20 min)
//
// Three-phase live exercise:
//   1. SOLVE: in 60 seconds, draft a teaching opener for a topic
//   2. EXPAND: in 5 minutes, write every thought that went into the draft
//   3. NOTICE: compare lengths. Most teaching thinking is invisible.
// ═══════════════════════════════════════════════════════════════════
import React from 'react';
import SectionShell from '@/components/SectionShell/SectionShell';
import GapIntro from './GapIntro';
import GapExercise from './GapExercise';
import GapReflection from './GapReflection';

const ThinkAloudSection: React.FC = () => (
  <SectionShell id="thinkaloud">
    <GapIntro />
    <GapExercise />
    <GapReflection />
  </SectionShell>
);

export default ThinkAloudSection;